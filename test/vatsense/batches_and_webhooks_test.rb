# frozen_string_literal: true

require_relative "test_helper"

# Batches, consultation_optional, confirmation_number and webhook signatures
# (late November 2026), sent through WebMock.
class Vatsense::Test::BatchesAndWebhooksTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  ID = "01JM0000000000000000000000"
  BATCH = {
    object: "batch",
    id: ID,
    number: 4,
    status: "processing",
    livemode: true,
    rows: {total: 2, to_check: 2, done: 1},
    quote: nil
  }.freeze
  SECRET = "whsec_test_secret"
  PAYLOAD = '{"id":"evt_1","type":"batch.completed","created":1793365200,"livemode":true,"data":{"object":{"object":"batch"}}}'

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def setup
    super
    @client = Vatsense::Client.new(base_url: "http://localhost", username: "user", password: "key")
  end

  def teardown
    WebMock.reset!
    super
  end

  def capture(method, url, data)
    sent = []
    stub_request(method, url)
      .with { |req| sent << req }
      .to_return_json(status: 200, body: {success: true, code: 200, data: data})
    sent
  end

  def test_create_sends_body_and_idempotency_key
    sent = capture(:post, "http://localhost/batches", BATCH)

    batch = @client.batches.create(
      rows: [{vat_number: "GB288305674", company_name: "Weio Ltd"}],
      shortfall: :pause,
      auto_continue: false,
      idempotency_key: "nov-1"
    )

    assert_equal("nov-1", sent.first.headers["Idempotency-Key"])
    assert_equal(
      {"rows" => [{"vat_number" => "GB288305674", "company_name" => "Weio Ltd"}], "shortfall" => "pause", "auto_continue" => false},
      JSON.parse(sent.first.body)
    )
    assert_equal(ID, batch.data.id)
    assert_equal(1, batch.data.rows.done)
    assert_nil(batch.data.quote)
  end

  def test_every_action_calls_its_path
    sent = []
    stub_request(:any, /localhost/)
      .with { |req| sent << req }
      .to_return_json(status: 200, body: {success: true, code: 200, data: BATCH})

    @client.batches.retrieve(ID)
    @client.batches.start(ID, shortfall: :overage)
    @client.batches.pause(ID)
    @client.batches.continue(ID)
    @client.batches.complete(ID)

    assert_equal(
      ["GET /batches/#{ID}", "POST /batches/#{ID}/start", "POST /batches/#{ID}/pause", "POST /batches/#{ID}/continue", "POST /batches/#{ID}/complete"],
      sent.map { "#{_1.method.upcase} #{_1.uri.path}" }
    )
    assert_equal({"shortfall" => "overage"}, JSON.parse(sent[1].body))
    assert_raises(ArgumentError) { @client.batches.retrieve("") }
  end

  def test_list_results_and_delete
    list = capture(:get, %r{localhost/batches\?}, {data: [BATCH], page: 2, limit: 10, total: 11, has_more: false})
    page = @client.batches.list(page: 2, limit: 10)
    assert_equal({"page" => "2", "limit" => "10"}, URI.decode_www_form(list.first.uri.query).to_h)
    assert_equal(11, page.data.total)
    assert_equal(ID, page.data.data.first.id)

    capture(:get, %r{localhost/batches/#{ID}/results}, {data: [{row: 1, vat_number: "GB288305674", result: "valid", confirmation_number: nil}], has_more: true, next_after: 1})
    results = @client.batches.results(ID, after: 0, limit: 1)
    assert(results.data.has_more)
    assert_equal(1, results.data.next_after)
    assert_equal("valid", results.data.data.first.result)

    capture(:delete, "http://localhost/batches/#{ID}", {object: "batch", id: ID, deleted: true})
    assert(@client.batches.delete(ID).data.deleted)
  end

  def test_results_csv_is_text
    stub_request(:get, "http://localhost/batches/#{ID}/results.csv")
      .to_return(status: 200, body: "row,vat_number\n1,GB288305674\n", headers: {"Content-Type" => "text/csv; charset=UTF-8"})

    assert_equal("row,vat_number\n1,GB288305674\n", @client.batches.results_csv(ID))
  end

  def test_validate_consultation_optional_and_confirmation_number
    sent = capture(:get, %r{localhost/validate}, {valid: true, confirmation_number: "VSC-ABC"})

    result = @client.validate.check(vat_number: "FR40303265045", requester_vat_number: "GB288305674", consultation_optional: true)

    assert_equal("true", URI.decode_www_form(sent.first.uri.query).to_h["consultation_optional"])
    assert_equal("VSC-ABC", result.data.confirmation_number)
  end

  def sign(timestamp, body, secret = SECRET)
    OpenSSL::HMAC.hexdigest("SHA256", secret, "#{timestamp}.#{body}")
  end

  def test_webhook_accepts_a_good_event_and_the_old_secret_during_a_roll
    event = Vatsense::Webhook.construct_event(PAYLOAD, "t=1793365200,v1=#{sign(1_793_365_200, PAYLOAD)}", SECRET, now: 1_793_365_260)
    assert_equal("batch.completed", event[:type])

    header = "t=1793365200,v1=#{sign(1_793_365_200, PAYLOAD, 'whsec_new')},v1=#{sign(1_793_365_200, PAYLOAD)}"
    assert(Vatsense::Webhook.verify_signature(PAYLOAD, header, SECRET, now: 1_793_365_200))
  end

  def test_webhook_refuses_bad_events
    [
      [nil, 1_793_365_200],
      ["", 1_793_365_200],
      ["v1=abc", 1_793_365_200],
      ["t=1793365200", 1_793_365_200],
      ["t=soon,v1=abc", 1_793_365_200],
      ["t=1793365200,v1=#{sign(1_793_365_200, PAYLOAD, 'whsec_other')}", 1_793_365_200],
      ["t=1793365200,v1=#{sign(1_793_365_200, PAYLOAD)}", 1_793_365_200 + 301]
    ].each do |header, now|
      assert_raises(Vatsense::Webhook::SignatureError) do
        Vatsense::Webhook.verify_signature(PAYLOAD, header, SECRET, now: now)
      end
    end
    assert_raises(Vatsense::Webhook::SignatureError) do
      Vatsense::Webhook.verify_signature(PAYLOAD.sub("true", "false"), "t=1793365200,v1=#{sign(1_793_365_200, PAYLOAD)}", SECRET, now: 1_793_365_200)
    end
  end
end

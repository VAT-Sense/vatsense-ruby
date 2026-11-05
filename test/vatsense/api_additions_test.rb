# frozen_string_literal: true

require_relative "test_helper"

# The API additions of November 2026, sent through WebMock.
class Vatsense::Test::APIAdditionsTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

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

  # Stubs the request and returns the list that the requests it saw are added to.
  def capture(method, url)
    sent = []
    stub_request(method, url)
      .with { |req| sent << req }
      .to_return_json(status: 200, body: {success: true, code: 200, data: {}})
    sent
  end

  def invoice_args
    {
      business: {name: "VAT Sense", address: "London", vat_number: "GB12345678"},
      currency_code: "GBP",
      date: "2026-11-05",
      tax_point: "2026-11-05",
      items: [{item: "Plan", price_each: 10, quantity: 1, vat_rate: 20}]
    }
  end

  def test_invoice_create_sends_idempotency_key_header
    sent = capture(:post, "http://localhost/invoice")

    @client.invoice.create(**invoice_args, type: :refund, original_invoice_id: "in5aeae457cda2a", idempotency_key: "order-203")

    body = JSON.parse(sent.first.body)
    assert_equal("order-203", sent.first.headers["Idempotency-Key"])
    assert_equal("in5aeae457cda2a", body["original_invoice_id"])
    refute(body.key?("idempotency_key"))
  end

  def test_invoice_create_without_key_sends_no_header
    sent = capture(:post, "http://localhost/invoice")

    @client.invoice.create(**invoice_args)

    refute(sent.first.headers.key?("Idempotency-Key"))
  end

  def test_validate_match
    stub_request(:get, %r{http://localhost/validate}).to_return_json(
      status: 200,
      body: {
        success: true,
        code: 200,
        data: {
          valid: true,
          match: {result: "likely", score: 90, fields: {company_name: {result: "match", score: 100, vies: nil}}}
        }
      }
    )

    result = @client.validate.check(vat_number: "GB288305674", match_company_name: "Weio Ltd", match_postcode: "SW3 1GL")

    assert_requested(:get, "http://localhost/validate", query: {vat_number: "GB288305674", match_company_name: "Weio Ltd", match_postcode: "SW3 1GL"})
    assert_equal("likely", result.data.match.result)
    assert_equal(90, result.data.match.score)
    assert_equal(100, result.data.match.fields[:company_name].score)
  end

  def test_rates_list_provinces
    sent = capture(:get, %r{http://localhost/rates})

    @client.rates.list(provinces: false)

    assert_equal("provinces=false", sent.first.uri.query)
  end
end

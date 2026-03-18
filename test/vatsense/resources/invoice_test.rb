# frozen_string_literal: true

require_relative "../test_helper"

class Vatsense::Test::Resources::InvoiceTest < Vatsense::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @vat_sense.invoice.create(
        business: {
          address: "123 Example Street\nLondon\nSW3 1GL\nUnited Kingdom",
          name: "VAT Sense",
          vat_number: "GB12345678"
        },
        currency_code: "USD",
        date: "2018-06-03 14:02:00",
        items: [{item: "Standard payment plan", price_each: 19.99, quantity: 1, vat_rate: 20}],
        tax_point: "2018-06-03 14:02:00"
      )

    assert_pattern do
      response => Vatsense::InvoiceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::InvoiceAPI | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @vat_sense.invoice.retrieve("in5aeae457cda2a")

    assert_pattern do
      response => Vatsense::InvoiceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::InvoiceAPI | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @vat_sense.invoice.update(
        "in5aeae457cda2a",
        business: {
          address: "123 Example Street\nLondon\nSW3 1GL\nUnited Kingdom",
          name: "VAT Sense",
          vat_number: "GB12345678"
        },
        currency_code: "USD",
        date: "2018-06-03 14:02:00",
        items: [{item: "Standard payment plan", price_each: 19.99, quantity: 1, vat_rate: 20}],
        tax_point: "2018-06-03 14:02:00"
      )

    assert_pattern do
      response => Vatsense::InvoiceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::InvoiceAPI | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @vat_sense.invoice.list

    assert_pattern do
      response => Vatsense::Models::InvoiceListResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(Vatsense::Internal::Type::ArrayOf[Vatsense::InvoiceAPI]) | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @vat_sense.invoice.delete("in5aeae457cda2a")

    assert_pattern do
      response => Vatsense::Models::InvoiceDeleteResponse
    end

    assert_pattern do
      response => {
        code: Integer,
        success: Vatsense::Internal::Type::Boolean
      }
    end
  end
end

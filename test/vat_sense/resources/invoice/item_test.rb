# frozen_string_literal: true

require_relative "../../test_helper"

class VatSense::Test::Resources::Invoice::ItemTest < VatSense::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.invoice.item.retrieve("ii5aeae457ce201", invoice_id: "in5aeae457cda2a")

    assert_pattern do
      response => VatSense::Models::Invoice::ItemRetrieveResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::Invoice::InvoiceItem | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @vat_sense.invoice.item.update(
        "ii5aeae457ce201",
        invoice_id: "in5aeae457cda2a",
        item: "Standard payment plan",
        price_each: 19.99,
        quantity: 1,
        vat_rate: 20
      )

    assert_pattern do
      response => VatSense::InvoiceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::InvoiceAPI | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.invoice.item.delete("ii5aeae457ce201", invoice_id: "in5aeae457cda2a")

    assert_pattern do
      response => VatSense::InvoiceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::InvoiceAPI | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_add_required_params
    skip("Mock server tests are disabled")

    response =
      @vat_sense.invoice.item.add(
        "in5aeae457cda2a",
        items: [{item: "Standard payment plan", price_each: 19.99, quantity: 1, vat_rate: 20}]
      )

    assert_pattern do
      response => VatSense::InvoiceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::InvoiceAPI | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end
end

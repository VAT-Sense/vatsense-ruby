# frozen_string_literal: true

require_relative "../test_helper"

class VatSense::Test::Resources::CurrencyTest < VatSense::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @vat_sense.currency.list

    assert_pattern do
      response => VatSense::Models::CurrencyListResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(VatSense::Internal::Type::ArrayOf[VatSense::Models::CurrencyListResponse::Data]) | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_calculate_vat_price_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.currency.calculate_vat_price(price: "20.00", tax_type: :excl, vat_rate: 5)

    assert_pattern do
      response => VatSense::Models::CurrencyCalculateVatPriceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::VatPrice | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_convert_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.currency.convert(amount: "39.99", from: "USD", to: :GBP)

    assert_pattern do
      response => VatSense::Models::CurrencyConvertResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::Models::CurrencyConvertResponse::Data | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end
end

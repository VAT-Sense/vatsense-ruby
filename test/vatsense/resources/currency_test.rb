# frozen_string_literal: true

require_relative "../test_helper"

class Vatsense::Test::Resources::CurrencyTest < Vatsense::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @vat_sense.currency.list

    assert_pattern do
      response => Vatsense::Models::CurrencyListResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(Vatsense::Internal::Type::ArrayOf[Vatsense::Models::CurrencyListResponse::Data]) | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_calculate_vat_price_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.currency.calculate_vat_price(price: "20.00", tax_type: :excl, vat_rate: 5)

    assert_pattern do
      response => Vatsense::Models::CurrencyCalculateVatPriceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::VatPrice | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_convert_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.currency.convert(amount: "39.99", from: "USD", to: :GBP)

    assert_pattern do
      response => Vatsense::Models::CurrencyConvertResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::Models::CurrencyConvertResponse::Data | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end
end

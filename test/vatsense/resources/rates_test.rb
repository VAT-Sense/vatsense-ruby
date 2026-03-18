# frozen_string_literal: true

require_relative "../test_helper"

class Vatsense::Test::Resources::RatesTest < Vatsense::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.list

    assert_pattern do
      response => Vatsense::Models::RateListResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(Vatsense::Internal::Type::ArrayOf[Vatsense::Rate]) | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_calculate_price_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.calculate_price(price: "20.00", tax_type: :excl)

    assert_pattern do
      response => Vatsense::Models::RateCalculatePriceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::Models::RateCalculatePriceResponse::Data | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_details
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.details

    assert_pattern do
      response => Vatsense::FindRate
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::RateWithTaxRate | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_find
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.find

    assert_pattern do
      response => Vatsense::FindRate
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::RateWithTaxRate | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_types
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.list_types

    assert_pattern do
      response => Vatsense::Models::RateListTypesResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(Vatsense::Internal::Type::ArrayOf[String]) | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end
end

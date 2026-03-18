# frozen_string_literal: true

require_relative "../test_helper"

class VatSense::Test::Resources::RatesTest < VatSense::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.list

    assert_pattern do
      response => VatSense::Models::RateListResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(VatSense::Internal::Type::ArrayOf[VatSense::Rate]) | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_calculate_price_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.calculate_price(price: "20.00", tax_type: :excl)

    assert_pattern do
      response => VatSense::Models::RateCalculatePriceResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::Models::RateCalculatePriceResponse::Data | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_details
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.details

    assert_pattern do
      response => VatSense::FindRate
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::RateWithTaxRate | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_find
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.find

    assert_pattern do
      response => VatSense::FindRate
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::RateWithTaxRate | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_types
    skip("Mock server tests are disabled")

    response = @vat_sense.rates.list_types

    assert_pattern do
      response => VatSense::Models::RateListTypesResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(VatSense::Internal::Type::ArrayOf[String]) | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end
end

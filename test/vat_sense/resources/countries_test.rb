# frozen_string_literal: true

require_relative "../test_helper"

class VatSense::Test::Resources::CountriesTest < VatSense::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @vat_sense.countries.list

    assert_pattern do
      response => VatSense::Models::CountryListResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(VatSense::Internal::Type::ArrayOf[VatSense::Country]) | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_provinces_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.countries.list_provinces(country_code: "CA")

    assert_pattern do
      response => VatSense::Models::CountryListProvincesResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(VatSense::Internal::Type::ArrayOf[VatSense::Models::CountryListProvincesResponse::Data]) | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end
end

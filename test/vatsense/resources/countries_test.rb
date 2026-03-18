# frozen_string_literal: true

require_relative "../test_helper"

class Vatsense::Test::Resources::CountriesTest < Vatsense::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @vat_sense.countries.list

    assert_pattern do
      response => Vatsense::Models::CountryListResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(Vatsense::Internal::Type::ArrayOf[Vatsense::Country]) | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list_provinces_required_params
    skip("Mock server tests are disabled")

    response = @vat_sense.countries.list_provinces(country_code: "CA")

    assert_pattern do
      response => Vatsense::Models::CountryListProvincesResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: ^(Vatsense::Internal::Type::ArrayOf[Vatsense::Models::CountryListProvincesResponse::Data]) | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end
end

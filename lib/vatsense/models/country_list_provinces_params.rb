# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Countries#list_provinces
    class CountryListProvincesParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute country_code
      #   A 2-character ISO 3166-1 alpha-2 country code (e.g. "CA").
      #
      #   @return [String]
      required :country_code, String

      # @!method initialize(country_code:, request_options: {})
      #   @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "CA").
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

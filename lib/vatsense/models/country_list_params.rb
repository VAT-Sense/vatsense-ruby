# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Countries#list
    class CountryListParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute country_code
      #   A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute ip_address
      #   An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #   address.
      #
      #   @return [String, nil]
      optional :ip_address, String

      # @!method initialize(country_code: nil, ip_address: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::CountryListParams} for more details.
      #
      #   @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

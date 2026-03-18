# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Rates#find
    class RateFindParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute country_code
      #   A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute eu
      #   Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      #   @return [Boolean, nil]
      optional :eu, Vatsense::Internal::Type::Boolean

      # @!attribute ip_address
      #   An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #   address.
      #
      #   @return [String, nil]
      optional :ip_address, String

      # @!attribute period
      #   A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      #   a past date.
      #
      #   @return [Time, nil]
      optional :period, Time

      # @!attribute province_code
      #   A 2-character province code (e.g. "NU", "NT"). If providing a province code, you
      #   must also provide the relevant country_code.
      #
      #   @return [String, nil]
      optional :province_code, String

      # @!attribute type
      #   The product type to find the applicable rate for. See the /rates/types endpoint
      #   for a full list of valid values.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(country_code: nil, eu: nil, ip_address: nil, period: nil, province_code: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::RateFindParams} for more details.
      #
      #   @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      #   @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      #   @param period [Time] A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      #
      #   @param province_code [String] A 2-character province code (e.g. "NU", "NT"). If providing a province
      #
      #   @param type [String] The product type to find the applicable rate for. See the /rates/types
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

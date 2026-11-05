# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Rates#list
    class RateListParams < Vatsense::Internal::Type::BaseModel
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

      # @!attribute provinces
      #   Whether to list province and territory rates (rate objects that carry a
      #   `province` property) in each country's `other` list. Pass false to leave them
      #   out, so only country-wide rates are listed; true, or omitting the parameter,
      #   lists them as before. The `standard` rate is always the country-wide one.
      #
      #   @return [Boolean, nil]
      optional :provinces, Vatsense::Internal::Type::Boolean

      # @!method initialize(country_code: nil, eu: nil, ip_address: nil, period: nil, provinces: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::RateListParams} for more details.
      #
      #   @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      #   @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      #   @param period [Time] A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

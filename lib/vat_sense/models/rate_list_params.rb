# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Rates#list
    class RateListParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      # @!attribute country_code
      #   A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute eu
      #   Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      #   @return [Boolean, nil]
      optional :eu, VatSense::Internal::Type::Boolean

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

      # @!method initialize(country_code: nil, eu: nil, ip_address: nil, period: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {VatSense::Models::RateListParams} for more details.
      #
      #   @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      #   @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      #   @param period [Time] A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      #
      #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

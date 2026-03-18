# frozen_string_literal: true

module VatSense
  module Resources
    # VAT/GST rate lookups for countries worldwide
    class Rates
      # Some parameter documentations has been truncated, see
      # {VatSense::Models::RateListParams} for more details.
      #
      # Returns a list of VAT/GST rates for all countries, sorted alphabetically by
      # country code. Each rate is returned as a rate object containing the standard
      # rate and any other applicable rates.
      #
      # You can optionally filter by country code, IP address, or EU membership.
      #
      # @overload list(country_code: nil, eu: nil, ip_address: nil, period: nil, request_options: {})
      #
      # @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      # @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      # @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      # @param period [Time] A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      #
      # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [VatSense::Models::RateListResponse]
      #
      # @see VatSense::Models::RateListParams
      def list(params = {})
        parsed, options = VatSense::RateListParams.dump_request(params)
        query = VatSense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "rates",
          query: query,
          model: VatSense::Models::RateListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {VatSense::Models::RateCalculatePriceParams} for more details.
      #
      # Combines the functionality of the "Find a tax rate" and "VAT price calculation"
      # endpoints to return the particular VAT price for an applicable VAT rate.
      # Requires both a location (country_code or ip_address) and a price to calculate.
      #
      # @overload calculate_price(price:, tax_type:, country_code: nil, eu: nil, ip_address: nil, province_code: nil, type: nil, request_options: {})
      #
      # @param price [String] The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      #
      # @param tax_type [Symbol, VatSense::Models::RateCalculatePriceParams::TaxType] Whether the provided price is inclusive or exclusive of VAT.
      #
      # @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      # @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      # @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      # @param province_code [String] A 2-character province code (e.g. "NU", "NT"). If providing a province
      #
      # @param type [String] The product type to find the applicable rate for. See the /rates/types
      #
      # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [VatSense::Models::RateCalculatePriceResponse]
      #
      # @see VatSense::Models::RateCalculatePriceParams
      def calculate_price(params)
        parsed, options = VatSense::RateCalculatePriceParams.dump_request(params)
        query = VatSense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "rates/price",
          query: query,
          model: VatSense::Models::RateCalculatePriceResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {VatSense::Models::RateDetailsParams} for more details.
      #
      # Get detailed tax rate information for a location, including all applicable rate
      # classes (standard, reduced, zero, etc.).
      #
      # @overload details(country_code: nil, eu: nil, ip_address: nil, period: nil, province_code: nil, type: nil, request_options: {})
      #
      # @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      # @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      # @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      # @param period [Time] A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      #
      # @param province_code [String] A 2-character province code (e.g. "NU", "NT"). If providing a province
      #
      # @param type [String] The product type to find the applicable rate for. See the /rates/types
      #
      # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [VatSense::Models::FindRate]
      #
      # @see VatSense::Models::RateDetailsParams
      def details(params = {})
        parsed, options = VatSense::RateDetailsParams.dump_request(params)
        query = VatSense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "rates/tax_rate",
          query: query,
          model: VatSense::FindRate,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {VatSense::Models::RateFindParams} for more details.
      #
      # A handy endpoint for finding a rate that applies to a particular country and
      # optional product type, based on country code or IP address.
      #
      # If no type is provided, or no specific rate is applied to the given type, then
      # the standard rate will be returned if the country is subject to tax.
      #
      # If the country is not subject to VAT/GST then an error response will be
      # returned, indicating no tax applies.
      #
      # @overload find(country_code: nil, eu: nil, ip_address: nil, period: nil, province_code: nil, type: nil, request_options: {})
      #
      # @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      # @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      # @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      # @param period [Time] A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      #
      # @param province_code [String] A 2-character province code (e.g. "NU", "NT"). If providing a province
      #
      # @param type [String] The product type to find the applicable rate for. See the /rates/types
      #
      # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [VatSense::Models::FindRate]
      #
      # @see VatSense::Models::RateFindParams
      def find(params = {})
        parsed, options = VatSense::RateFindParams.dump_request(params)
        query = VatSense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "rates/rate",
          query: query,
          model: VatSense::FindRate,
          options: options
        )
      end

      # Returns a list of all available product types that can be used to filter tax
      # rates.
      #
      # @overload list_types(request_options: {})
      #
      # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [VatSense::Models::RateListTypesResponse]
      #
      # @see VatSense::Models::RateListTypesParams
      def list_types(params = {})
        @client.request(
          method: :get,
          path: "rates/types",
          model: VatSense::Models::RateListTypesResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [VatSense::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end

# frozen_string_literal: true

module Vatsense
  module Resources
    # Country and province information
    class Countries
      # Some parameter documentations has been truncated, see
      # {Vatsense::Models::CountryListParams} for more details.
      #
      # Returns a list of all countries, including whether they are subject to VAT/GST
      # and whether they are subject to EU VAT. Each country is returned as a country
      # object.
      #
      # You can optionally filter by country code or IP address.
      #
      # @overload list(country_code: nil, ip_address: nil, request_options: {})
      #
      # @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      # @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::CountryListResponse]
      #
      # @see Vatsense::Models::CountryListParams
      def list(params = {})
        parsed, options = Vatsense::CountryListParams.dump_request(params)
        query = Vatsense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "countries",
          query: query,
          model: Vatsense::Models::CountryListResponse,
          options: options
        )
      end

      # Retrieve a list of all provinces within a given country.
      #
      # @overload list_provinces(country_code:, request_options: {})
      #
      # @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "CA").
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::CountryListProvincesResponse]
      #
      # @see Vatsense::Models::CountryListProvincesParams
      def list_provinces(params)
        parsed, options = Vatsense::CountryListProvincesParams.dump_request(params)
        query = Vatsense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "countries/provinces",
          query: query,
          model: Vatsense::Models::CountryListProvincesResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Vatsense::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end

# typed: strong

module Vatsense
  module Resources
    # Country and province information
    class Countries
      # Returns a list of all countries, including whether they are subject to VAT/GST
      # and whether they are subject to EU VAT. Each country is returned as a country
      # object.
      #
      # You can optionally filter by country code or IP address.
      sig do
        params(
          country_code: String,
          ip_address: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::CountryListResponse)
      end
      def list(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
        country_code: nil,
        # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
        # address.
        ip_address: nil,
        request_options: {}
      )
      end

      # Retrieve a list of all provinces within a given country.
      sig do
        params(
          country_code: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::CountryListProvincesResponse)
      end
      def list_provinces(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "CA").
        country_code:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Vatsense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

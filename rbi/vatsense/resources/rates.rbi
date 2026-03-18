# typed: strong

module Vatsense
  module Resources
    # VAT/GST rate lookups for countries worldwide
    class Rates
      # Returns a list of VAT/GST rates for all countries, sorted alphabetically by
      # country code. Each rate is returned as a rate object containing the standard
      # rate and any other applicable rates.
      #
      # You can optionally filter by country code, IP address, or EU membership.
      sig do
        params(
          country_code: String,
          eu: T::Boolean,
          ip_address: String,
          period: Time,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::RateListResponse)
      end
      def list(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
        country_code: nil,
        # Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
        eu: nil,
        # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
        # address.
        ip_address: nil,
        # A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
        # a past date.
        period: nil,
        request_options: {}
      )
      end

      # Combines the functionality of the "Find a tax rate" and "VAT price calculation"
      # endpoints to return the particular VAT price for an applicable VAT rate.
      # Requires both a location (country_code or ip_address) and a price to calculate.
      sig do
        params(
          price: String,
          tax_type: Vatsense::RateCalculatePriceParams::TaxType::OrSymbol,
          country_code: String,
          eu: T::Boolean,
          ip_address: String,
          province_code: String,
          type: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::RateCalculatePriceResponse)
      end
      def calculate_price(
        # The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
        # "30.00", "59.95").
        price:,
        # Whether the provided price is inclusive or exclusive of VAT.
        tax_type:,
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
        country_code: nil,
        # Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
        eu: nil,
        # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
        # address.
        ip_address: nil,
        # A 2-character province code (e.g. "NU", "NT"). If providing a province code, you
        # must also provide the relevant country_code.
        province_code: nil,
        # The product type to find the applicable rate for. See the /rates/types endpoint
        # for a full list of valid values.
        type: nil,
        request_options: {}
      )
      end

      # Get detailed tax rate information for a location, including all applicable rate
      # classes (standard, reduced, zero, etc.).
      sig do
        params(
          country_code: String,
          eu: T::Boolean,
          ip_address: String,
          period: Time,
          province_code: String,
          type: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::FindRate)
      end
      def details(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
        country_code: nil,
        # Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
        eu: nil,
        # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
        # address.
        ip_address: nil,
        # A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
        # a past date.
        period: nil,
        # A 2-character province code (e.g. "NU", "NT"). If providing a province code, you
        # must also provide the relevant country_code.
        province_code: nil,
        # The product type to find the applicable rate for. See the /rates/types endpoint
        # for a full list of valid values.
        type: nil,
        request_options: {}
      )
      end

      # A handy endpoint for finding a rate that applies to a particular country and
      # optional product type, based on country code or IP address.
      #
      # If no type is provided, or no specific rate is applied to the given type, then
      # the standard rate will be returned if the country is subject to tax.
      #
      # If the country is not subject to VAT/GST then an error response will be
      # returned, indicating no tax applies.
      sig do
        params(
          country_code: String,
          eu: T::Boolean,
          ip_address: String,
          period: Time,
          province_code: String,
          type: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::FindRate)
      end
      def find(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
        country_code: nil,
        # Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
        eu: nil,
        # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
        # address.
        ip_address: nil,
        # A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
        # a past date.
        period: nil,
        # A 2-character province code (e.g. "NU", "NT"). If providing a province code, you
        # must also provide the relevant country_code.
        province_code: nil,
        # The product type to find the applicable rate for. See the /rates/types endpoint
        # for a full list of valid values.
        type: nil,
        request_options: {}
      )
      end

      # Returns a list of all available product types that can be used to filter tax
      # rates.
      sig do
        params(request_options: Vatsense::RequestOptions::OrHash).returns(
          Vatsense::Models::RateListTypesResponse
        )
      end
      def list_types(request_options: {})
      end

      # @api private
      sig { params(client: Vatsense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

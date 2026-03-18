# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Rates#calculate_price
    class RateCalculatePriceParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute price
      #   The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      #   "30.00", "59.95").
      #
      #   @return [String]
      required :price, String

      # @!attribute tax_type
      #   Whether the provided price is inclusive or exclusive of VAT.
      #
      #   @return [Symbol, Vatsense::Models::RateCalculatePriceParams::TaxType]
      required :tax_type, enum: -> { Vatsense::RateCalculatePriceParams::TaxType }

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

      # @!method initialize(price:, tax_type:, country_code: nil, eu: nil, ip_address: nil, province_code: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::RateCalculatePriceParams} for more details.
      #
      #   @param price [String] The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      #
      #   @param tax_type [Symbol, Vatsense::Models::RateCalculatePriceParams::TaxType] Whether the provided price is inclusive or exclusive of VAT.
      #
      #   @param country_code [String] A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      #
      #   @param eu [Boolean] Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      #
      #   @param ip_address [String] An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      #
      #   @param province_code [String] A 2-character province code (e.g. "NU", "NT"). If providing a province
      #
      #   @param type [String] The product type to find the applicable rate for. See the /rates/types
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]

      # Whether the provided price is inclusive or exclusive of VAT.
      module TaxType
        extend Vatsense::Internal::Type::Enum

        INCL = :incl
        EXCL = :excl

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

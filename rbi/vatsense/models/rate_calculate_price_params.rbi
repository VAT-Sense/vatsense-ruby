# typed: strong

module Vatsense
  module Models
    class RateCalculatePriceParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Vatsense::RateCalculatePriceParams, Vatsense::Internal::AnyHash)
        end

      # The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      # "30.00", "59.95").
      sig { returns(String) }
      attr_accessor :price

      # Whether the provided price is inclusive or exclusive of VAT.
      sig { returns(Vatsense::RateCalculatePriceParams::TaxType::OrSymbol) }
      attr_accessor :tax_type

      # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :eu

      sig { params(eu: T::Boolean).void }
      attr_writer :eu

      # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      # address.
      sig { returns(T.nilable(String)) }
      attr_reader :ip_address

      sig { params(ip_address: String).void }
      attr_writer :ip_address

      # A 2-character province code (e.g. "NU", "NT"). If providing a province code, you
      # must also provide the relevant country_code.
      sig { returns(T.nilable(String)) }
      attr_reader :province_code

      sig { params(province_code: String).void }
      attr_writer :province_code

      # The product type to find the applicable rate for. See the /rates/types endpoint
      # for a full list of valid values.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            price: String,
            tax_type: Vatsense::RateCalculatePriceParams::TaxType::OrSymbol,
            country_code: String,
            eu: T::Boolean,
            ip_address: String,
            province_code: String,
            type: String,
            request_options: Vatsense::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether the provided price is inclusive or exclusive of VAT.
      module TaxType
        extend Vatsense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Vatsense::RateCalculatePriceParams::TaxType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCL =
          T.let(
            :incl,
            Vatsense::RateCalculatePriceParams::TaxType::TaggedSymbol
          )
        EXCL =
          T.let(
            :excl,
            Vatsense::RateCalculatePriceParams::TaxType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Vatsense::RateCalculatePriceParams::TaxType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

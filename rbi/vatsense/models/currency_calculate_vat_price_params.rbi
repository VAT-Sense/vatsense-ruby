# typed: strong

module Vatsense
  module Models
    class CurrencyCalculateVatPriceParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Vatsense::CurrencyCalculateVatPriceParams,
            Vatsense::Internal::AnyHash
          )
        end

      # The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      # "30.00", "59.95").
      sig { returns(String) }
      attr_accessor :price

      # Whether the provided price is inclusive or exclusive of VAT.
      sig do
        returns(Vatsense::CurrencyCalculateVatPriceParams::TaxType::OrSymbol)
      end
      attr_accessor :tax_type

      # A percentage VAT rate to use for the calculation.
      sig { returns(Float) }
      attr_accessor :vat_rate

      sig do
        params(
          price: String,
          tax_type:
            Vatsense::CurrencyCalculateVatPriceParams::TaxType::OrSymbol,
          vat_rate: Float,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
        # "30.00", "59.95").
        price:,
        # Whether the provided price is inclusive or exclusive of VAT.
        tax_type:,
        # A percentage VAT rate to use for the calculation.
        vat_rate:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            price: String,
            tax_type:
              Vatsense::CurrencyCalculateVatPriceParams::TaxType::OrSymbol,
            vat_rate: Float,
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
            T.all(Symbol, Vatsense::CurrencyCalculateVatPriceParams::TaxType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCL =
          T.let(
            :incl,
            Vatsense::CurrencyCalculateVatPriceParams::TaxType::TaggedSymbol
          )
        EXCL =
          T.let(
            :excl,
            Vatsense::CurrencyCalculateVatPriceParams::TaxType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Vatsense::CurrencyCalculateVatPriceParams::TaxType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end

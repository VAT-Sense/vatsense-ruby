# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Currency#calculate_vat_price
    class CurrencyCalculateVatPriceParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      # @!attribute price
      #   The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      #   "30.00", "59.95").
      #
      #   @return [String]
      required :price, String

      # @!attribute tax_type
      #   Whether the provided price is inclusive or exclusive of VAT.
      #
      #   @return [Symbol, VatSense::Models::CurrencyCalculateVatPriceParams::TaxType]
      required :tax_type, enum: -> { VatSense::CurrencyCalculateVatPriceParams::TaxType }

      # @!attribute vat_rate
      #   A percentage VAT rate to use for the calculation.
      #
      #   @return [Float]
      required :vat_rate, Float

      # @!method initialize(price:, tax_type:, vat_rate:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {VatSense::Models::CurrencyCalculateVatPriceParams} for more details.
      #
      #   @param price [String] The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      #
      #   @param tax_type [Symbol, VatSense::Models::CurrencyCalculateVatPriceParams::TaxType] Whether the provided price is inclusive or exclusive of VAT.
      #
      #   @param vat_rate [Float] A percentage VAT rate to use for the calculation.
      #
      #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]

      # Whether the provided price is inclusive or exclusive of VAT.
      module TaxType
        extend VatSense::Internal::Type::Enum

        INCL = :incl
        EXCL = :excl

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

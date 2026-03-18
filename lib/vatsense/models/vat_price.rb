# frozen_string_literal: true

module Vatsense
  module Models
    class VatPrice < Vatsense::Internal::Type::BaseModel
      # @!attribute object
      #
      #   @return [Symbol, Vatsense::Models::VatPrice::Object, nil]
      optional :object, enum: -> { Vatsense::VatPrice::Object }

      # @!attribute price
      #   The price provided.
      #
      #   @return [Float, nil]
      optional :price, Float

      # @!attribute price_excl_vat
      #   The calculated price exclusive of VAT.
      #
      #   @return [Float, nil]
      optional :price_excl_vat, Float

      # @!attribute price_incl_vat
      #   The calculated price inclusive of VAT.
      #
      #   @return [Float, nil]
      optional :price_incl_vat, Float

      # @!attribute tax_type
      #   Whether the price is inclusive or exclusive of VAT.
      #
      #   @return [Symbol, Vatsense::Models::VatPrice::TaxType, nil]
      optional :tax_type, enum: -> { Vatsense::VatPrice::TaxType }

      # @!attribute vat
      #   The total VAT amount.
      #
      #   @return [Float, nil]
      optional :vat, Float

      # @!attribute vat_rate
      #   The VAT rate percentage.
      #
      #   @return [Float, nil]
      optional :vat_rate, Float

      # @!method initialize(object: nil, price: nil, price_excl_vat: nil, price_incl_vat: nil, tax_type: nil, vat: nil, vat_rate: nil)
      #   @param object [Symbol, Vatsense::Models::VatPrice::Object]
      #
      #   @param price [Float] The price provided.
      #
      #   @param price_excl_vat [Float] The calculated price exclusive of VAT.
      #
      #   @param price_incl_vat [Float] The calculated price inclusive of VAT.
      #
      #   @param tax_type [Symbol, Vatsense::Models::VatPrice::TaxType] Whether the price is inclusive or exclusive of VAT.
      #
      #   @param vat [Float] The total VAT amount.
      #
      #   @param vat_rate [Float] The VAT rate percentage.

      # @see Vatsense::Models::VatPrice#object
      module Object
        extend Vatsense::Internal::Type::Enum

        VAT_PRICE = :vat_price

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether the price is inclusive or exclusive of VAT.
      #
      # @see Vatsense::Models::VatPrice#tax_type
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

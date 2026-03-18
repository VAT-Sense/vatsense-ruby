# frozen_string_literal: true

module VatSense
  module Models
    class RateWithTaxRate < VatSense::Internal::Type::BaseModel
      # @!attribute country_code
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute country_name
      #
      #   @return [String, nil]
      optional :country_name, String

      # @!attribute eu
      #
      #   @return [Boolean, nil]
      optional :eu, VatSense::Internal::Type::Boolean

      # @!attribute object
      #
      #   @return [Symbol, VatSense::Models::RateWithTaxRate::Object, nil]
      optional :object, enum: -> { VatSense::RateWithTaxRate::Object }

      # @!attribute tax_rate
      #
      #   @return [VatSense::Models::TaxRate, nil]
      optional :tax_rate, -> { VatSense::TaxRate }

      # @!method initialize(country_code: nil, country_name: nil, eu: nil, object: nil, tax_rate: nil)
      #   @param country_code [String]
      #   @param country_name [String]
      #   @param eu [Boolean]
      #   @param object [Symbol, VatSense::Models::RateWithTaxRate::Object]
      #   @param tax_rate [VatSense::Models::TaxRate]

      # @see VatSense::Models::RateWithTaxRate#object
      module Object
        extend VatSense::Internal::Type::Enum

        RATE = :rate

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

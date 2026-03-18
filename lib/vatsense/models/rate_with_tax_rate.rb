# frozen_string_literal: true

module Vatsense
  module Models
    class RateWithTaxRate < Vatsense::Internal::Type::BaseModel
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
      optional :eu, Vatsense::Internal::Type::Boolean

      # @!attribute object
      #
      #   @return [Symbol, Vatsense::Models::RateWithTaxRate::Object, nil]
      optional :object, enum: -> { Vatsense::RateWithTaxRate::Object }

      # @!attribute tax_rate
      #
      #   @return [Vatsense::Models::TaxRate, nil]
      optional :tax_rate, -> { Vatsense::TaxRate }

      # @!method initialize(country_code: nil, country_name: nil, eu: nil, object: nil, tax_rate: nil)
      #   @param country_code [String]
      #   @param country_name [String]
      #   @param eu [Boolean]
      #   @param object [Symbol, Vatsense::Models::RateWithTaxRate::Object]
      #   @param tax_rate [Vatsense::Models::TaxRate]

      # @see Vatsense::Models::RateWithTaxRate#object
      module Object
        extend Vatsense::Internal::Type::Enum

        RATE = :rate

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

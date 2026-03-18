# frozen_string_literal: true

module Vatsense
  module Models
    class TaxRate < Vatsense::Internal::Type::BaseModel
      # @!attribute class_
      #   The rate class (e.g. "standard", "reduced", "zero").
      #
      #   @return [String, nil]
      optional :class_, String, api_name: :class

      # @!attribute description
      #   A description of what goods/services this rate applies to.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute object
      #
      #   @return [Symbol, Vatsense::Models::TaxRate::Object, nil]
      optional :object, enum: -> { Vatsense::TaxRate::Object }

      # @!attribute rate
      #   The tax rate percentage.
      #
      #   @return [Float, nil]
      optional :rate, Float

      # @!attribute types
      #   Comma-separated list of product types this rate applies to, or false if it
      #   applies generally.
      #
      #   @return [String, Boolean, nil]
      optional :types, union: -> { Vatsense::TaxRate::Types }

      # @!method initialize(class_: nil, description: nil, object: nil, rate: nil, types: nil)
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::TaxRate} for more details.
      #
      #   @param class_ [String] The rate class (e.g. "standard", "reduced", "zero").
      #
      #   @param description [String] A description of what goods/services this rate applies to.
      #
      #   @param object [Symbol, Vatsense::Models::TaxRate::Object]
      #
      #   @param rate [Float] The tax rate percentage.
      #
      #   @param types [String, Boolean] Comma-separated list of product types this rate applies to, or false if it appli

      # @see Vatsense::Models::TaxRate#object
      module Object
        extend Vatsense::Internal::Type::Enum

        TAX_RATE = :tax_rate

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Comma-separated list of product types this rate applies to, or false if it
      # applies generally.
      #
      # @see Vatsense::Models::TaxRate#types
      module Types
        extend Vatsense::Internal::Type::Union

        variant String

        variant Vatsense::Internal::Type::Boolean

        # @!method self.variants
        #   @return [Array(String, Boolean)]
      end
    end
  end
end

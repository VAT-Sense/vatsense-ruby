# frozen_string_literal: true

module VatSense
  module Models
    class Rate < VatSense::Internal::Type::BaseModel
      # @!attribute country_code
      #   2-character ISO 3166-1 alpha-2 country code.
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute country_name
      #
      #   @return [String, nil]
      optional :country_name, String

      # @!attribute eu
      #   Whether the country is an EU member.
      #
      #   @return [Boolean, nil]
      optional :eu, VatSense::Internal::Type::Boolean

      # @!attribute object
      #
      #   @return [Symbol, VatSense::Models::Rate::Object, nil]
      optional :object, enum: -> { VatSense::Rate::Object }

      # @!attribute other
      #   A list of other tax rates. Null if no additional rates exist.
      #
      #   @return [Array<VatSense::Models::Rate::Other>, nil]
      optional :other, -> { VatSense::Internal::Type::ArrayOf[VatSense::Rate::Other] }, nil?: true

      # @!attribute standard
      #
      #   @return [VatSense::Models::TaxRate, nil]
      optional :standard, -> { VatSense::TaxRate }

      # @!method initialize(country_code: nil, country_name: nil, eu: nil, object: nil, other: nil, standard: nil)
      #   @param country_code [String] 2-character ISO 3166-1 alpha-2 country code.
      #
      #   @param country_name [String]
      #
      #   @param eu [Boolean] Whether the country is an EU member.
      #
      #   @param object [Symbol, VatSense::Models::Rate::Object]
      #
      #   @param other [Array<VatSense::Models::Rate::Other>, nil] A list of other tax rates. Null if no additional rates exist.
      #
      #   @param standard [VatSense::Models::TaxRate]

      # @see VatSense::Models::Rate#object
      module Object
        extend VatSense::Internal::Type::Enum

        RATE = :rate

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Other < VatSense::Models::TaxRate
        # @!attribute province
        #   The province this rate applies to, if applicable.
        #
        #   @return [String, nil]
        optional :province, String, nil?: true

        # @!method initialize(province: nil)
        #   @param province [String, nil] The province this rate applies to, if applicable.
      end
    end
  end
end

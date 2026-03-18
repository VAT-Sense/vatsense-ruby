# frozen_string_literal: true

module VatSense
  module Models
    class Country < VatSense::Internal::Type::BaseModel
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
      #   Whether the country is subject to EU VAT.
      #
      #   @return [Boolean, nil]
      optional :eu, VatSense::Internal::Type::Boolean

      # @!attribute latitude
      #
      #   @return [Float, nil]
      optional :latitude, Float

      # @!attribute longitude
      #
      #   @return [Float, nil]
      optional :longitude, Float

      # @!attribute object
      #
      #   @return [Symbol, VatSense::Models::Country::Object, nil]
      optional :object, enum: -> { VatSense::Country::Object }

      # @!attribute vat
      #   Whether the country is subject to VAT/GST.
      #
      #   @return [Boolean, nil]
      optional :vat, VatSense::Internal::Type::Boolean

      # @!method initialize(country_code: nil, country_name: nil, eu: nil, latitude: nil, longitude: nil, object: nil, vat: nil)
      #   @param country_code [String] 2-character ISO 3166-1 alpha-2 country code.
      #
      #   @param country_name [String]
      #
      #   @param eu [Boolean] Whether the country is subject to EU VAT.
      #
      #   @param latitude [Float]
      #
      #   @param longitude [Float]
      #
      #   @param object [Symbol, VatSense::Models::Country::Object]
      #
      #   @param vat [Boolean] Whether the country is subject to VAT/GST.

      # @see VatSense::Models::Country#object
      module Object
        extend VatSense::Internal::Type::Enum

        COUNTRY = :country

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

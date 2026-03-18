# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Rates#calculate_price
    class RateCalculatePriceResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::RateCalculatePriceResponse::Data, nil]
      optional :data, -> { Vatsense::Models::RateCalculatePriceResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::RateCalculatePriceResponse::Data]
      #   @param success [Boolean]

      # @see Vatsense::Models::RateCalculatePriceResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
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
        #   @return [Symbol, Vatsense::Models::RateCalculatePriceResponse::Data::Object, nil]
        optional :object, enum: -> { Vatsense::Models::RateCalculatePriceResponse::Data::Object }

        # @!attribute tax_rate
        #
        #   @return [Vatsense::Models::TaxRate, nil]
        optional :tax_rate, -> { Vatsense::TaxRate }

        # @!attribute vat_price
        #
        #   @return [Vatsense::Models::VatPrice, nil]
        optional :vat_price, -> { Vatsense::VatPrice }

        # @!method initialize(country_code: nil, country_name: nil, eu: nil, object: nil, tax_rate: nil, vat_price: nil)
        #   @param country_code [String]
        #   @param country_name [String]
        #   @param eu [Boolean]
        #   @param object [Symbol, Vatsense::Models::RateCalculatePriceResponse::Data::Object]
        #   @param tax_rate [Vatsense::Models::TaxRate]
        #   @param vat_price [Vatsense::Models::VatPrice]

        # @see Vatsense::Models::RateCalculatePriceResponse::Data#object
        module Object
          extend Vatsense::Internal::Type::Enum

          RATE = :rate

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

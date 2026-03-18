# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Rates#calculate_price
    class RateCalculatePriceResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [VatSense::Models::RateCalculatePriceResponse::Data, nil]
      optional :data, -> { VatSense::Models::RateCalculatePriceResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [VatSense::Models::RateCalculatePriceResponse::Data]
      #   @param success [Boolean]

      # @see VatSense::Models::RateCalculatePriceResponse#data
      class Data < VatSense::Internal::Type::BaseModel
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
        #   @return [Symbol, VatSense::Models::RateCalculatePriceResponse::Data::Object, nil]
        optional :object, enum: -> { VatSense::Models::RateCalculatePriceResponse::Data::Object }

        # @!attribute tax_rate
        #
        #   @return [VatSense::Models::TaxRate, nil]
        optional :tax_rate, -> { VatSense::TaxRate }

        # @!attribute vat_price
        #
        #   @return [VatSense::Models::VatPrice, nil]
        optional :vat_price, -> { VatSense::VatPrice }

        # @!method initialize(country_code: nil, country_name: nil, eu: nil, object: nil, tax_rate: nil, vat_price: nil)
        #   @param country_code [String]
        #   @param country_name [String]
        #   @param eu [Boolean]
        #   @param object [Symbol, VatSense::Models::RateCalculatePriceResponse::Data::Object]
        #   @param tax_rate [VatSense::Models::TaxRate]
        #   @param vat_price [VatSense::Models::VatPrice]

        # @see VatSense::Models::RateCalculatePriceResponse::Data#object
        module Object
          extend VatSense::Internal::Type::Enum

          RATE = :rate

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

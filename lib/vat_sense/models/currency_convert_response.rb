# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Currency#convert
    class CurrencyConvertResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [VatSense::Models::CurrencyConvertResponse::Data, nil]
      optional :data, -> { VatSense::Models::CurrencyConvertResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [VatSense::Models::CurrencyConvertResponse::Data]
      #   @param success [Boolean]

      # @see VatSense::Models::CurrencyConvertResponse#data
      class Data < VatSense::Internal::Type::BaseModel
        # @!attribute amount
        #   The original amount.
        #
        #   @return [Float, nil]
        optional :amount, Float

        # @!attribute converted
        #   The converted amount.
        #
        #   @return [Float, nil]
        optional :converted, Float

        # @!attribute from
        #
        #   @return [String, nil]
        optional :from, String

        # @!attribute object
        #
        #   @return [Symbol, VatSense::Models::CurrencyConvertResponse::Data::Object, nil]
        optional :object, enum: -> { VatSense::Models::CurrencyConvertResponse::Data::Object }

        # @!attribute rate
        #   The exchange rate used.
        #
        #   @return [Float, nil]
        optional :rate, Float

        # @!attribute to
        #
        #   @return [String, nil]
        optional :to, String

        # @!method initialize(amount: nil, converted: nil, from: nil, object: nil, rate: nil, to: nil)
        #   @param amount [Float] The original amount.
        #
        #   @param converted [Float] The converted amount.
        #
        #   @param from [String]
        #
        #   @param object [Symbol, VatSense::Models::CurrencyConvertResponse::Data::Object]
        #
        #   @param rate [Float] The exchange rate used.
        #
        #   @param to [String]

        # @see VatSense::Models::CurrencyConvertResponse::Data#object
        module Object
          extend VatSense::Internal::Type::Enum

          CONVERSION = :conversion

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Currency#convert
    class CurrencyConvertResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::CurrencyConvertResponse::Data, nil]
      optional :data, -> { Vatsense::Models::CurrencyConvertResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::CurrencyConvertResponse::Data]
      #   @param success [Boolean]

      # @see Vatsense::Models::CurrencyConvertResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
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
        #   @return [Symbol, Vatsense::Models::CurrencyConvertResponse::Data::Object, nil]
        optional :object, enum: -> { Vatsense::Models::CurrencyConvertResponse::Data::Object }

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
        #   @param object [Symbol, Vatsense::Models::CurrencyConvertResponse::Data::Object]
        #
        #   @param rate [Float] The exchange rate used.
        #
        #   @param to [String]

        # @see Vatsense::Models::CurrencyConvertResponse::Data#object
        module Object
          extend Vatsense::Internal::Type::Enum

          CONVERSION = :conversion

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

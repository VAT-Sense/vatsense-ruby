# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Currency#list
    class CurrencyListResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<Vatsense::Models::CurrencyListResponse::Data>, nil]
      optional :data, -> { Vatsense::Internal::Type::ArrayOf[Vatsense::Models::CurrencyListResponse::Data] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<Vatsense::Models::CurrencyListResponse::Data>]
      #   @param success [Boolean]

      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute from
        #   The 3-character source currency code.
        #
        #   @return [String, nil]
        optional :from, String

        # @!attribute object
        #
        #   @return [Symbol, Vatsense::Models::CurrencyListResponse::Data::Object, nil]
        optional :object, enum: -> { Vatsense::Models::CurrencyListResponse::Data::Object }

        # @!attribute rate
        #   The exchange rate.
        #
        #   @return [Float, nil]
        optional :rate, Float

        # @!attribute to
        #   The 3-character target currency code (GBP or EUR).
        #
        #   @return [String, nil]
        optional :to, String

        # @!method initialize(from: nil, object: nil, rate: nil, to: nil)
        #   @param from [String] The 3-character source currency code.
        #
        #   @param object [Symbol, Vatsense::Models::CurrencyListResponse::Data::Object]
        #
        #   @param rate [Float] The exchange rate.
        #
        #   @param to [String] The 3-character target currency code (GBP or EUR).

        # @see Vatsense::Models::CurrencyListResponse::Data#object
        module Object
          extend Vatsense::Internal::Type::Enum

          CONVERT_RATE = :convert_rate

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

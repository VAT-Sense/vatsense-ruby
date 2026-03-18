# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Currency#list
    class CurrencyListResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<VatSense::Models::CurrencyListResponse::Data>, nil]
      optional :data, -> { VatSense::Internal::Type::ArrayOf[VatSense::Models::CurrencyListResponse::Data] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<VatSense::Models::CurrencyListResponse::Data>]
      #   @param success [Boolean]

      class Data < VatSense::Internal::Type::BaseModel
        # @!attribute from
        #   The 3-character source currency code.
        #
        #   @return [String, nil]
        optional :from, String

        # @!attribute object
        #
        #   @return [Symbol, VatSense::Models::CurrencyListResponse::Data::Object, nil]
        optional :object, enum: -> { VatSense::Models::CurrencyListResponse::Data::Object }

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
        #   @param object [Symbol, VatSense::Models::CurrencyListResponse::Data::Object]
        #
        #   @param rate [Float] The exchange rate.
        #
        #   @param to [String] The 3-character target currency code (GBP or EUR).

        # @see VatSense::Models::CurrencyListResponse::Data#object
        module Object
          extend VatSense::Internal::Type::Enum

          CONVERT_RATE = :convert_rate

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

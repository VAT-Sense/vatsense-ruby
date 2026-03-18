# frozen_string_literal: true

module Vatsense
  module Models
    class InvoiceConversionInput < Vatsense::Internal::Type::BaseModel
      # @!attribute currency_code
      #   The 3-character currency code for the conversion.
      #
      #   @return [String]
      required :currency_code, String

      # @!attribute rate
      #   The rate of conversion.
      #
      #   @return [Float]
      required :rate, Float

      # @!method initialize(currency_code:, rate:)
      #   @param currency_code [String] The 3-character currency code for the conversion.
      #
      #   @param rate [Float] The rate of conversion.
    end
  end
end

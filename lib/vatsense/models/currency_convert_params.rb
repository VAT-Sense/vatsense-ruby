# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Currency#convert
    class CurrencyConvertParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute amount
      #   The amount to convert. Must be a string with exactly 2 decimal places (e.g.
      #   "39.99").
      #
      #   @return [String]
      required :amount, String

      # @!attribute from
      #   The 3-character source currency code (e.g. "USD", "CAD").
      #
      #   @return [String]
      required :from, String

      # @!attribute to
      #   The 3-character target currency code. Must be either "GBP" or "EUR".
      #
      #   @return [Symbol, Vatsense::Models::CurrencyConvertParams::To]
      required :to, enum: -> { Vatsense::CurrencyConvertParams::To }

      # @!method initialize(amount:, from:, to:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::CurrencyConvertParams} for more details.
      #
      #   @param amount [String] The amount to convert. Must be a string with exactly 2 decimal places (e.g. "39.
      #
      #   @param from [String] The 3-character source currency code (e.g. "USD", "CAD").
      #
      #   @param to [Symbol, Vatsense::Models::CurrencyConvertParams::To] The 3-character target currency code. Must be either "GBP" or "EUR".
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]

      # The 3-character target currency code. Must be either "GBP" or "EUR".
      module To
        extend Vatsense::Internal::Type::Enum

        GBP = :GBP
        EUR = :EUR

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

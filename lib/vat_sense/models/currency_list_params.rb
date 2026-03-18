# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Currency#list
    class CurrencyListParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      # @!attribute from
      #   The 3-character currency code(s) to convert from (e.g. "USD", "CAD"). Can be a
      #   comma-separated list without spaces (e.g. "USD,CAD,AUD").
      #
      #   @return [String, nil]
      optional :from, String

      # @!attribute to
      #   The 3-character target currency code. Must be either "GBP" or "EUR".
      #
      #   @return [Symbol, VatSense::Models::CurrencyListParams::To, nil]
      optional :to, enum: -> { VatSense::CurrencyListParams::To }

      # @!method initialize(from: nil, to: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {VatSense::Models::CurrencyListParams} for more details.
      #
      #   @param from [String] The 3-character currency code(s) to convert from (e.g. "USD", "CAD").
      #
      #   @param to [Symbol, VatSense::Models::CurrencyListParams::To] The 3-character target currency code. Must be either "GBP" or "EUR".
      #
      #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]

      # The 3-character target currency code. Must be either "GBP" or "EUR".
      module To
        extend VatSense::Internal::Type::Enum

        GBP = :GBP
        EUR = :EUR

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

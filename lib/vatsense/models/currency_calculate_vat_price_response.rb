# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Currency#calculate_vat_price
    class CurrencyCalculateVatPriceResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::VatPrice, nil]
      optional :data, -> { Vatsense::VatPrice }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::VatPrice]
      #   @param success [Boolean]
    end
  end
end

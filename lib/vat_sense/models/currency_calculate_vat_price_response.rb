# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Currency#calculate_vat_price
    class CurrencyCalculateVatPriceResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [VatSense::Models::VatPrice, nil]
      optional :data, -> { VatSense::VatPrice }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [VatSense::Models::VatPrice]
      #   @param success [Boolean]
    end
  end
end

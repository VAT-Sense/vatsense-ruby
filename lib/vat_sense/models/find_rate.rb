# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Rates#details
    class FindRate < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [VatSense::Models::RateWithTaxRate, nil]
      optional :data, -> { VatSense::RateWithTaxRate }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [VatSense::Models::RateWithTaxRate]
      #   @param success [Boolean]
    end
  end
end

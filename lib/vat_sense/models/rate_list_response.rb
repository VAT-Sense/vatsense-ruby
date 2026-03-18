# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Rates#list
    class RateListResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<VatSense::Models::Rate>, nil]
      optional :data, -> { VatSense::Internal::Type::ArrayOf[VatSense::Rate] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<VatSense::Models::Rate>]
      #   @param success [Boolean]
    end
  end
end

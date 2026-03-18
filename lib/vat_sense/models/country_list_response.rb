# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Countries#list
    class CountryListResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<VatSense::Models::Country>, nil]
      optional :data, -> { VatSense::Internal::Type::ArrayOf[VatSense::Country] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<VatSense::Models::Country>]
      #   @param success [Boolean]
    end
  end
end

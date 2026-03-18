# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Invoice#delete
    class InvoiceDeleteResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code:, success:)
      #   @param code [Integer]
      #   @param success [Boolean]
    end
  end
end

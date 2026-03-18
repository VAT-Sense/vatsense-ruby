# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Invoice#create
    class InvoiceResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [VatSense::Models::InvoiceAPI, nil]
      optional :data, -> { VatSense::InvoiceAPI }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [VatSense::Models::InvoiceAPI]
      #   @param success [Boolean]
    end
  end
end

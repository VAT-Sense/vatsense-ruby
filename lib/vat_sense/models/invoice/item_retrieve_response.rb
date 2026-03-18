# frozen_string_literal: true

module VatSense
  module Models
    module Invoice
      # @see VatSense::Resources::Invoice::Item#retrieve
      class ItemRetrieveResponse < VatSense::Internal::Type::BaseModel
        # @!attribute code
        #
        #   @return [Integer, nil]
        optional :code, Integer

        # @!attribute data
        #
        #   @return [VatSense::Models::Invoice::InvoiceItem, nil]
        optional :data, -> { VatSense::Invoice::InvoiceItem }

        # @!attribute success
        #
        #   @return [Boolean, nil]
        optional :success, VatSense::Internal::Type::Boolean

        # @!method initialize(code: nil, data: nil, success: nil)
        #   @param code [Integer]
        #   @param data [VatSense::Models::Invoice::InvoiceItem]
        #   @param success [Boolean]
      end
    end
  end
end

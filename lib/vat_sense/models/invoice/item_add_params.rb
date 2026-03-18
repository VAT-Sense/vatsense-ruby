# frozen_string_literal: true

module VatSense
  module Models
    module Invoice
      # @see VatSense::Resources::Invoice::Item#add
      class ItemAddParams < VatSense::Internal::Type::BaseModel
        extend VatSense::Internal::Type::RequestParameters::Converter
        include VatSense::Internal::Type::RequestParameters

        # @!attribute invoice_id
        #
        #   @return [String]
        required :invoice_id, String

        # @!attribute items
        #
        #   @return [Array<VatSense::Models::Invoice::InvoiceItemInput>]
        required :items, -> { VatSense::Internal::Type::ArrayOf[VatSense::Invoice::InvoiceItemInput] }

        # @!method initialize(invoice_id:, items:, request_options: {})
        #   @param invoice_id [String]
        #   @param items [Array<VatSense::Models::Invoice::InvoiceItemInput>]
        #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

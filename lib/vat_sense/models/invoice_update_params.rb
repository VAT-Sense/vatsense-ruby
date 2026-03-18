# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Invoice#update
    class InvoiceUpdateParams < VatSense::Models::CreateInvoice
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      # @!attribute invoice_id
      #
      #   @return [String]
      required :invoice_id, String

      # @!method initialize(invoice_id:, request_options: {})
      #   @param invoice_id [String]
      #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

# frozen_string_literal: true

module VatSense
  module Models
    module Invoice
      # @see VatSense::Resources::Invoice::Item#delete
      class ItemDeleteParams < VatSense::Internal::Type::BaseModel
        extend VatSense::Internal::Type::RequestParameters::Converter
        include VatSense::Internal::Type::RequestParameters

        # @!attribute invoice_id
        #
        #   @return [String]
        required :invoice_id, String

        # @!attribute item_id
        #
        #   @return [String]
        required :item_id, String

        # @!method initialize(invoice_id:, item_id:, request_options: {})
        #   @param invoice_id [String]
        #   @param item_id [String]
        #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

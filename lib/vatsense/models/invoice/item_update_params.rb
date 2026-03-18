# frozen_string_literal: true

module Vatsense
  module Models
    module Invoice
      # @see Vatsense::Resources::Invoice::Item#update
      class ItemUpdateParams < Vatsense::Models::Invoice::InvoiceItemInput
        extend Vatsense::Internal::Type::RequestParameters::Converter
        include Vatsense::Internal::Type::RequestParameters

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
        #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

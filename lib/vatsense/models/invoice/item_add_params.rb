# frozen_string_literal: true

module Vatsense
  module Models
    module Invoice
      # @see Vatsense::Resources::Invoice::Item#add
      class ItemAddParams < Vatsense::Internal::Type::BaseModel
        extend Vatsense::Internal::Type::RequestParameters::Converter
        include Vatsense::Internal::Type::RequestParameters

        # @!attribute invoice_id
        #
        #   @return [String]
        required :invoice_id, String

        # @!attribute items
        #
        #   @return [Array<Vatsense::Models::Invoice::InvoiceItemInput>]
        required :items, -> { Vatsense::Internal::Type::ArrayOf[Vatsense::Invoice::InvoiceItemInput] }

        # @!method initialize(invoice_id:, items:, request_options: {})
        #   @param invoice_id [String]
        #   @param items [Array<Vatsense::Models::Invoice::InvoiceItemInput>]
        #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Invoice#update
    class InvoiceUpdateParams < Vatsense::Models::CreateInvoice
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute invoice_id
      #
      #   @return [String]
      required :invoice_id, String

      # @!method initialize(invoice_id:, request_options: {})
      #   @param invoice_id [String]
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

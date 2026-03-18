# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Invoice#create
    class InvoiceCreateParams < VatSense::Models::CreateInvoice
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Invoice#create
    class InvoiceCreateParams < Vatsense::Models::CreateInvoice
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute idempotency_key
      #   Sent as the `Idempotency-Key` header to retry a create safely: a repeat with the
      #   same key and the same body, byte for byte, creates nothing and returns the
      #   invoice the first request made. The same key with a different body gets `422`
      #   "Idempotency Key Reused". 1 to 255 characters, unique to this invoice (such as
      #   your order number or a UUID).
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(idempotency_key: nil, request_options: {})
      #   @param idempotency_key [String] Sent as the `Idempotency-Key` header to retry a create safely.
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

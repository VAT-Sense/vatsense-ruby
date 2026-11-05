# typed: strong

module Vatsense
  module Models
    class InvoiceCreateParams < Vatsense::Models::CreateInvoice
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Vatsense::InvoiceCreateParams, Vatsense::Internal::AnyHash)
        end

      # Sent as the `Idempotency-Key` header to retry a create safely.
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          idempotency_key: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(idempotency_key: nil, request_options: {})
      end

      sig do
        override.returns(
          { idempotency_key: String, request_options: Vatsense::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module Vatsense
  module Models
    class InvoiceUpdateParams < Vatsense::Models::CreateInvoice
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Vatsense::InvoiceUpdateParams, Vatsense::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :invoice_id

      sig do
        params(
          invoice_id: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(invoice_id:, request_options: {})
      end

      sig do
        override.returns(
          { invoice_id: String, request_options: Vatsense::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module VatSense
  module Models
    class InvoiceUpdateParams < VatSense::Models::CreateInvoice
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(VatSense::InvoiceUpdateParams, VatSense::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :invoice_id

      sig do
        params(
          invoice_id: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(invoice_id:, request_options: {})
      end

      sig do
        override.returns(
          { invoice_id: String, request_options: VatSense::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

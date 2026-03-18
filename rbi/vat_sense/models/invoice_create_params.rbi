# typed: strong

module VatSense
  module Models
    class InvoiceCreateParams < VatSense::Models::CreateInvoice
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(VatSense::InvoiceCreateParams, VatSense::Internal::AnyHash)
        end

      sig do
        params(request_options: VatSense::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: VatSense::RequestOptions }) }
      def to_hash
      end
    end
  end
end

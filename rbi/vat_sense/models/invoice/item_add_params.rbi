# typed: strong

module VatSense
  module Models
    module Invoice
      class ItemAddParams < VatSense::Internal::Type::BaseModel
        extend VatSense::Internal::Type::RequestParameters::Converter
        include VatSense::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(VatSense::Invoice::ItemAddParams, VatSense::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :invoice_id

        sig { returns(T::Array[VatSense::Invoice::InvoiceItemInput]) }
        attr_accessor :items

        sig do
          params(
            invoice_id: String,
            items: T::Array[VatSense::Invoice::InvoiceItemInput::OrHash],
            request_options: VatSense::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(invoice_id:, items:, request_options: {})
        end

        sig do
          override.returns(
            {
              invoice_id: String,
              items: T::Array[VatSense::Invoice::InvoiceItemInput],
              request_options: VatSense::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

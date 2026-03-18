# typed: strong

module VatSense
  module Models
    module Invoice
      class ItemRetrieveParams < VatSense::Internal::Type::BaseModel
        extend VatSense::Internal::Type::RequestParameters::Converter
        include VatSense::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              VatSense::Invoice::ItemRetrieveParams,
              VatSense::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :invoice_id

        sig { returns(String) }
        attr_accessor :item_id

        sig do
          params(
            invoice_id: String,
            item_id: String,
            request_options: VatSense::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(invoice_id:, item_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              invoice_id: String,
              item_id: String,
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

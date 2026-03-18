# typed: strong

module VatSense
  module Models
    module Invoice
      class ItemRetrieveResponse < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              VatSense::Models::Invoice::ItemRetrieveResponse,
              VatSense::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :code

        sig { params(code: Integer).void }
        attr_writer :code

        sig { returns(T.nilable(VatSense::Invoice::InvoiceItem)) }
        attr_reader :data

        sig { params(data: VatSense::Invoice::InvoiceItem::OrHash).void }
        attr_writer :data

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :success

        sig { params(success: T::Boolean).void }
        attr_writer :success

        sig do
          params(
            code: Integer,
            data: VatSense::Invoice::InvoiceItem::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(code: nil, data: nil, success: nil)
        end

        sig do
          override.returns(
            {
              code: Integer,
              data: VatSense::Invoice::InvoiceItem,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

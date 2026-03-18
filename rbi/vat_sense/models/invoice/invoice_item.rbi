# typed: strong

module VatSense
  module Models
    InvoiceItem = Invoice::InvoiceItem

    module Invoice
      class InvoiceItem < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(VatSense::Invoice::InvoiceItem, VatSense::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(Float)) }
        attr_accessor :discount_rate

        sig { returns(T.nilable(String)) }
        attr_reader :item

        sig { params(item: String).void }
        attr_writer :item

        sig do
          returns(
            T.nilable(VatSense::Invoice::InvoiceItem::Object::TaggedSymbol)
          )
        end
        attr_reader :object

        sig do
          params(object: VatSense::Invoice::InvoiceItem::Object::OrSymbol).void
        end
        attr_writer :object

        sig { returns(T.nilable(Float)) }
        attr_reader :price_each

        sig { params(price_each: Float).void }
        attr_writer :price_each

        sig { returns(T.nilable(Float)) }
        attr_reader :price_total

        sig { params(price_total: Float).void }
        attr_writer :price_total

        sig { returns(T.nilable(Float)) }
        attr_reader :quantity

        sig { params(quantity: Float).void }
        attr_writer :quantity

        sig { returns(T.nilable(Float)) }
        attr_reader :vat_rate

        sig { params(vat_rate: Float).void }
        attr_writer :vat_rate

        sig do
          params(
            id: String,
            discount_rate: T.nilable(Float),
            item: String,
            object: VatSense::Invoice::InvoiceItem::Object::OrSymbol,
            price_each: Float,
            price_total: Float,
            quantity: Float,
            vat_rate: Float
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          discount_rate: nil,
          item: nil,
          object: nil,
          price_each: nil,
          price_total: nil,
          quantity: nil,
          vat_rate: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              discount_rate: T.nilable(Float),
              item: String,
              object: VatSense::Invoice::InvoiceItem::Object::TaggedSymbol,
              price_each: Float,
              price_total: Float,
              quantity: Float,
              vat_rate: Float
            }
          )
        end
        def to_hash
        end

        module Object
          extend VatSense::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, VatSense::Invoice::InvoiceItem::Object)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ITEM =
            T.let(:item, VatSense::Invoice::InvoiceItem::Object::TaggedSymbol)

          sig do
            override.returns(
              T::Array[VatSense::Invoice::InvoiceItem::Object::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

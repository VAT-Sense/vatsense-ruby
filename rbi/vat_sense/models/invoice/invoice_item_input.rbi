# typed: strong

module VatSense
  module Models
    InvoiceItemInput = Invoice::InvoiceItemInput

    module Invoice
      class InvoiceItemInput < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              VatSense::Invoice::InvoiceItemInput,
              VatSense::Internal::AnyHash
            )
          end

        # The description of the line item.
        sig { returns(String) }
        attr_accessor :item

        # The price per item. Must be a decimal with 2 decimal places.
        sig { returns(Float) }
        attr_accessor :price_each

        # The quantity of the item.
        sig { returns(Float) }
        attr_accessor :quantity

        # A percentage VAT rate for this item.
        sig { returns(Float) }
        attr_accessor :vat_rate

        # A percentage discount to apply to the price.
        sig { returns(T.nilable(Float)) }
        attr_reader :discount_rate

        sig { params(discount_rate: Float).void }
        attr_writer :discount_rate

        sig do
          params(
            item: String,
            price_each: Float,
            quantity: Float,
            vat_rate: Float,
            discount_rate: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # The description of the line item.
          item:,
          # The price per item. Must be a decimal with 2 decimal places.
          price_each:,
          # The quantity of the item.
          quantity:,
          # A percentage VAT rate for this item.
          vat_rate:,
          # A percentage discount to apply to the price.
          discount_rate: nil
        )
        end

        sig do
          override.returns(
            {
              item: String,
              price_each: Float,
              quantity: Float,
              vat_rate: Float,
              discount_rate: Float
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

# typed: strong

module VatSense
  module Resources
    class Invoice
      # VAT-compliant invoice management
      class Item
        # Retrieve a specific line item from an invoice.
        sig do
          params(
            item_id: String,
            invoice_id: String,
            request_options: VatSense::RequestOptions::OrHash
          ).returns(VatSense::Models::Invoice::ItemRetrieveResponse)
        end
        def retrieve(
          # The unique identifier of the invoice item.
          item_id,
          # The unique identifier of the invoice.
          invoice_id:,
          request_options: {}
        )
        end

        # Update a specific line item on an invoice.
        sig do
          params(
            item_id: String,
            invoice_id: String,
            item: String,
            price_each: Float,
            quantity: Float,
            vat_rate: Float,
            discount_rate: Float,
            request_options: VatSense::RequestOptions::OrHash
          ).returns(VatSense::InvoiceResponse)
        end
        def update(
          # Path param: The unique identifier of the invoice item.
          item_id,
          # Path param: The unique identifier of the invoice.
          invoice_id:,
          # Body param: The description of the line item.
          item:,
          # Body param: The price per item. Must be a decimal with 2 decimal places.
          price_each:,
          # Body param: The quantity of the item.
          quantity:,
          # Body param: A percentage VAT rate for this item.
          vat_rate:,
          # Body param: A percentage discount to apply to the price.
          discount_rate: nil,
          request_options: {}
        )
        end

        # Remove a specific line item from an invoice.
        sig do
          params(
            item_id: String,
            invoice_id: String,
            request_options: VatSense::RequestOptions::OrHash
          ).returns(VatSense::InvoiceResponse)
        end
        def delete(
          # The unique identifier of the invoice item.
          item_id,
          # The unique identifier of the invoice.
          invoice_id:,
          request_options: {}
        )
        end

        # Add one or more line items to an existing invoice.
        sig do
          params(
            invoice_id: String,
            items: T::Array[VatSense::Invoice::InvoiceItemInput::OrHash],
            request_options: VatSense::RequestOptions::OrHash
          ).returns(VatSense::InvoiceResponse)
        end
        def add(
          # The unique identifier of the invoice.
          invoice_id,
          items:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: VatSense::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end

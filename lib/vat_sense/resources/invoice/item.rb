# frozen_string_literal: true

module VatSense
  module Resources
    class Invoice
      # VAT-compliant invoice management
      class Item
        # Retrieve a specific line item from an invoice.
        #
        # @overload retrieve(item_id, invoice_id:, request_options: {})
        #
        # @param item_id [String] The unique identifier of the invoice item.
        #
        # @param invoice_id [String] The unique identifier of the invoice.
        #
        # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [VatSense::Models::Invoice::ItemRetrieveResponse]
        #
        # @see VatSense::Models::Invoice::ItemRetrieveParams
        def retrieve(item_id, params)
          parsed, options = VatSense::Invoice::ItemRetrieveParams.dump_request(params)
          invoice_id =
            parsed.delete(:invoice_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["invoice/%1$s/item/%2$s", invoice_id, item_id],
            model: VatSense::Models::Invoice::ItemRetrieveResponse,
            options: options
          )
        end

        # Update a specific line item on an invoice.
        #
        # @overload update(item_id, invoice_id:, item:, price_each:, quantity:, vat_rate:, discount_rate: nil, request_options: {})
        #
        # @param item_id [String] Path param: The unique identifier of the invoice item.
        #
        # @param invoice_id [String] Path param: The unique identifier of the invoice.
        #
        # @param item [String] Body param: The description of the line item.
        #
        # @param price_each [Float] Body param: The price per item. Must be a decimal with 2 decimal places.
        #
        # @param quantity [Float] Body param: The quantity of the item.
        #
        # @param vat_rate [Float] Body param: A percentage VAT rate for this item.
        #
        # @param discount_rate [Float] Body param: A percentage discount to apply to the price.
        #
        # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [VatSense::Models::InvoiceResponse]
        #
        # @see VatSense::Models::Invoice::ItemUpdateParams
        def update(item_id, params)
          parsed, options = VatSense::Invoice::ItemUpdateParams.dump_request(params)
          invoice_id =
            parsed.delete(:invoice_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["invoice/%1$s/item/%2$s", invoice_id, item_id],
            body: parsed,
            model: VatSense::InvoiceResponse,
            options: options
          )
        end

        # Remove a specific line item from an invoice.
        #
        # @overload delete(item_id, invoice_id:, request_options: {})
        #
        # @param item_id [String] The unique identifier of the invoice item.
        #
        # @param invoice_id [String] The unique identifier of the invoice.
        #
        # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [VatSense::Models::InvoiceResponse]
        #
        # @see VatSense::Models::Invoice::ItemDeleteParams
        def delete(item_id, params)
          parsed, options = VatSense::Invoice::ItemDeleteParams.dump_request(params)
          invoice_id =
            parsed.delete(:invoice_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["invoice/%1$s/item/%2$s", invoice_id, item_id],
            model: VatSense::InvoiceResponse,
            options: options
          )
        end

        # Add one or more line items to an existing invoice.
        #
        # @overload add(invoice_id, items:, request_options: {})
        #
        # @param invoice_id [String] The unique identifier of the invoice.
        #
        # @param items [Array<VatSense::Models::Invoice::InvoiceItemInput>]
        #
        # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [VatSense::Models::InvoiceResponse]
        #
        # @see VatSense::Models::Invoice::ItemAddParams
        def add(invoice_id, params)
          parsed, options = VatSense::Invoice::ItemAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["invoice/%1$s/item", invoice_id],
            body: parsed,
            model: VatSense::InvoiceResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [VatSense::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end

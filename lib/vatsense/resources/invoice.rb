# frozen_string_literal: true

module Vatsense
  module Resources
    # VAT-compliant invoice management
    class Invoice
      # VAT-compliant invoice management
      # @return [Vatsense::Resources::Invoice::Item]
      attr_reader :item

      # Some parameter documentations has been truncated, see
      # {Vatsense::Models::InvoiceCreateParams} for more details.
      #
      # Create a new VAT-compliant invoice. VAT Sense will automatically calculate the
      # totals based on the items provided.
      #
      # Not available with sandbox API keys.
      #
      # @overload create(business:, currency_code:, date:, items:, tax_point:, conversion: nil, customer: nil, has_vat: nil, invoice_number: nil, is_copy: nil, is_reverse_charge: nil, notes: nil, pad_invoice_number: nil, serial: nil, tax_type: nil, type: nil, zero_rated: nil, request_options: {})
      #
      # @param business [Vatsense::Models::InvoiceBusinessInput]
      #
      # @param currency_code [String] The 3-character currency code the invoice is billed in.
      #
      # @param date [String] The date the invoice was issued (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      # @param items [Array<Vatsense::Models::Invoice::InvoiceItemInput>]
      #
      # @param tax_point [String] The tax point or "time of supply" (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      # @param conversion [Vatsense::Models::InvoiceConversionInput]
      #
      # @param customer [Vatsense::Models::InvoiceCustomerInput]
      #
      # @param has_vat [Boolean] Whether the invoice is subject to VAT.
      #
      # @param invoice_number [String] A unique invoice number. If not provided, defaults to an auto-incremented number
      #
      # @param is_copy [Boolean] Whether the invoice is a copy of a primary invoice.
      #
      # @param is_reverse_charge [Boolean] Whether the invoice is zero-rated due to reverse charge.
      #
      # @param notes [String] Any additional notes for the invoice.
      #
      # @param pad_invoice_number [Integer] Pad the auto-generated invoice number with leading zeros to this length.
      #
      # @param serial [String] A serial prepended to the auto-generated invoice number. Each unique serial has
      #
      # @param tax_type [Symbol, Vatsense::Models::CreateInvoice::TaxType] Whether item prices include or exclude VAT.
      #
      # @param type [Symbol, Vatsense::Models::CreateInvoice::Type] The type of invoice.
      #
      # @param zero_rated [Boolean] Whether the invoice has been zero-rated.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::InvoiceResponse]
      #
      # @see Vatsense::Models::InvoiceCreateParams
      def create(params)
        parsed, options = Vatsense::InvoiceCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "invoice",
          body: parsed,
          model: Vatsense::InvoiceResponse,
          options: options
        )
      end

      # Retrieve a specific invoice by its ID.
      #
      # @overload retrieve(invoice_id, request_options: {})
      #
      # @param invoice_id [String] The unique identifier of the invoice.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::InvoiceResponse]
      #
      # @see Vatsense::Models::InvoiceRetrieveParams
      def retrieve(invoice_id, params = {})
        @client.request(
          method: :get,
          path: ["invoice/%1$s", invoice_id],
          model: Vatsense::InvoiceResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Vatsense::Models::InvoiceUpdateParams} for more details.
      #
      # Update an existing invoice. Only the fields provided will be updated.
      #
      # @overload update(invoice_id, business:, currency_code:, date:, items:, tax_point:, conversion: nil, customer: nil, has_vat: nil, invoice_number: nil, is_copy: nil, is_reverse_charge: nil, notes: nil, pad_invoice_number: nil, serial: nil, tax_type: nil, type: nil, zero_rated: nil, request_options: {})
      #
      # @param invoice_id [String] The unique identifier of the invoice.
      #
      # @param business [Vatsense::Models::InvoiceBusinessInput]
      #
      # @param currency_code [String] The 3-character currency code the invoice is billed in.
      #
      # @param date [String] The date the invoice was issued (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      # @param items [Array<Vatsense::Models::Invoice::InvoiceItemInput>]
      #
      # @param tax_point [String] The tax point or "time of supply" (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      # @param conversion [Vatsense::Models::InvoiceConversionInput]
      #
      # @param customer [Vatsense::Models::InvoiceCustomerInput]
      #
      # @param has_vat [Boolean] Whether the invoice is subject to VAT.
      #
      # @param invoice_number [String] A unique invoice number. If not provided, defaults to an auto-incremented number
      #
      # @param is_copy [Boolean] Whether the invoice is a copy of a primary invoice.
      #
      # @param is_reverse_charge [Boolean] Whether the invoice is zero-rated due to reverse charge.
      #
      # @param notes [String] Any additional notes for the invoice.
      #
      # @param pad_invoice_number [Integer] Pad the auto-generated invoice number with leading zeros to this length.
      #
      # @param serial [String] A serial prepended to the auto-generated invoice number. Each unique serial has
      #
      # @param tax_type [Symbol, Vatsense::Models::CreateInvoice::TaxType] Whether item prices include or exclude VAT.
      #
      # @param type [Symbol, Vatsense::Models::CreateInvoice::Type] The type of invoice.
      #
      # @param zero_rated [Boolean] Whether the invoice has been zero-rated.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::InvoiceResponse]
      #
      # @see Vatsense::Models::InvoiceUpdateParams
      def update(invoice_id, params)
        parsed, options = Vatsense::InvoiceUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["invoice/%1$s", invoice_id],
          body: parsed,
          model: Vatsense::InvoiceResponse,
          options: options
        )
      end

      # Retrieve a paginated list of all invoices.
      #
      # @overload list(limit: nil, offset: nil, search: nil, request_options: {})
      #
      # @param limit [Integer] Number of invoices to return (default 10, max 100).
      #
      # @param offset [Integer] Number of invoices to skip (default 0).
      #
      # @param search [String] Search query to filter invoices.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::InvoiceListResponse]
      #
      # @see Vatsense::Models::InvoiceListParams
      def list(params = {})
        parsed, options = Vatsense::InvoiceListParams.dump_request(params)
        query = Vatsense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "invoice",
          query: query,
          model: Vatsense::Models::InvoiceListResponse,
          options: options
        )
      end

      # Permanently delete an invoice.
      #
      # @overload delete(invoice_id, request_options: {})
      #
      # @param invoice_id [String] The unique identifier of the invoice.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::InvoiceDeleteResponse]
      #
      # @see Vatsense::Models::InvoiceDeleteParams
      def delete(invoice_id, params = {})
        @client.request(
          method: :delete,
          path: ["invoice/%1$s", invoice_id],
          model: Vatsense::Models::InvoiceDeleteResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Vatsense::Client]
      def initialize(client:)
        @client = client
        @item = Vatsense::Resources::Invoice::Item.new(client: client)
      end
    end
  end
end

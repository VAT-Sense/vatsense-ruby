# typed: strong

module VatSense
  module Resources
    # VAT-compliant invoice management
    class Invoice
      # VAT-compliant invoice management
      sig { returns(VatSense::Resources::Invoice::Item) }
      attr_reader :item

      # Create a new VAT-compliant invoice. VAT Sense will automatically calculate the
      # totals based on the items provided.
      #
      # Not available with sandbox API keys.
      sig do
        params(
          business: VatSense::InvoiceBusinessInput::OrHash,
          currency_code: String,
          date: String,
          items: T::Array[VatSense::Invoice::InvoiceItemInput::OrHash],
          tax_point: String,
          conversion: VatSense::InvoiceConversionInput::OrHash,
          customer: VatSense::InvoiceCustomerInput::OrHash,
          has_vat: T::Boolean,
          invoice_number: String,
          is_copy: T::Boolean,
          is_reverse_charge: T::Boolean,
          notes: String,
          pad_invoice_number: Integer,
          serial: String,
          tax_type: VatSense::CreateInvoice::TaxType::OrSymbol,
          type: VatSense::CreateInvoice::Type::OrSymbol,
          zero_rated: T::Boolean,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(VatSense::InvoiceResponse)
      end
      def create(
        business:,
        # The 3-character currency code the invoice is billed in.
        currency_code:,
        # The date the invoice was issued (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
        date:,
        items:,
        # The tax point or "time of supply" (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
        tax_point:,
        conversion: nil,
        customer: nil,
        # Whether the invoice is subject to VAT.
        has_vat: nil,
        # A unique invoice number. If not provided, defaults to an auto-incremented
        # number.
        invoice_number: nil,
        # Whether the invoice is a copy of a primary invoice.
        is_copy: nil,
        # Whether the invoice is zero-rated due to reverse charge.
        is_reverse_charge: nil,
        # Any additional notes for the invoice.
        notes: nil,
        # Pad the auto-generated invoice number with leading zeros to this length.
        pad_invoice_number: nil,
        # A serial prepended to the auto-generated invoice number. Each unique serial has
        # its own auto-increment range.
        serial: nil,
        # Whether item prices include or exclude VAT.
        tax_type: nil,
        # The type of invoice.
        type: nil,
        # Whether the invoice has been zero-rated.
        zero_rated: nil,
        request_options: {}
      )
      end

      # Retrieve a specific invoice by its ID.
      sig do
        params(
          invoice_id: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(VatSense::InvoiceResponse)
      end
      def retrieve(
        # The unique identifier of the invoice.
        invoice_id,
        request_options: {}
      )
      end

      # Update an existing invoice. Only the fields provided will be updated.
      sig do
        params(
          invoice_id: String,
          business: VatSense::InvoiceBusinessInput::OrHash,
          currency_code: String,
          date: String,
          items: T::Array[VatSense::Invoice::InvoiceItemInput::OrHash],
          tax_point: String,
          conversion: VatSense::InvoiceConversionInput::OrHash,
          customer: VatSense::InvoiceCustomerInput::OrHash,
          has_vat: T::Boolean,
          invoice_number: String,
          is_copy: T::Boolean,
          is_reverse_charge: T::Boolean,
          notes: String,
          pad_invoice_number: Integer,
          serial: String,
          tax_type: VatSense::CreateInvoice::TaxType::OrSymbol,
          type: VatSense::CreateInvoice::Type::OrSymbol,
          zero_rated: T::Boolean,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(VatSense::InvoiceResponse)
      end
      def update(
        # The unique identifier of the invoice.
        invoice_id,
        business:,
        # The 3-character currency code the invoice is billed in.
        currency_code:,
        # The date the invoice was issued (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
        date:,
        items:,
        # The tax point or "time of supply" (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
        tax_point:,
        conversion: nil,
        customer: nil,
        # Whether the invoice is subject to VAT.
        has_vat: nil,
        # A unique invoice number. If not provided, defaults to an auto-incremented
        # number.
        invoice_number: nil,
        # Whether the invoice is a copy of a primary invoice.
        is_copy: nil,
        # Whether the invoice is zero-rated due to reverse charge.
        is_reverse_charge: nil,
        # Any additional notes for the invoice.
        notes: nil,
        # Pad the auto-generated invoice number with leading zeros to this length.
        pad_invoice_number: nil,
        # A serial prepended to the auto-generated invoice number. Each unique serial has
        # its own auto-increment range.
        serial: nil,
        # Whether item prices include or exclude VAT.
        tax_type: nil,
        # The type of invoice.
        type: nil,
        # Whether the invoice has been zero-rated.
        zero_rated: nil,
        request_options: {}
      )
      end

      # Retrieve a paginated list of all invoices.
      sig do
        params(
          limit: Integer,
          offset: Integer,
          search: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(VatSense::Models::InvoiceListResponse)
      end
      def list(
        # Number of invoices to return (default 10, max 100).
        limit: nil,
        # Number of invoices to skip (default 0).
        offset: nil,
        # Search query to filter invoices.
        search: nil,
        request_options: {}
      )
      end

      # Permanently delete an invoice.
      sig do
        params(
          invoice_id: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(VatSense::Models::InvoiceDeleteResponse)
      end
      def delete(
        # The unique identifier of the invoice.
        invoice_id,
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

# frozen_string_literal: true

module VatSense
  module Models
    class CreateInvoice < VatSense::Internal::Type::BaseModel
      # @!attribute business
      #
      #   @return [VatSense::Models::InvoiceBusinessInput]
      required :business, -> { VatSense::InvoiceBusinessInput }

      # @!attribute currency_code
      #   The 3-character currency code the invoice is billed in.
      #
      #   @return [String]
      required :currency_code, String

      # @!attribute date
      #   The date the invoice was issued (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      #   @return [String]
      required :date, String

      # @!attribute items
      #
      #   @return [Array<VatSense::Models::Invoice::InvoiceItemInput>]
      required :items, -> { VatSense::Internal::Type::ArrayOf[VatSense::Invoice::InvoiceItemInput] }

      # @!attribute tax_point
      #   The tax point or "time of supply" (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      #   @return [String]
      required :tax_point, String

      # @!attribute conversion
      #
      #   @return [VatSense::Models::InvoiceConversionInput, nil]
      optional :conversion, -> { VatSense::InvoiceConversionInput }

      # @!attribute customer
      #
      #   @return [VatSense::Models::InvoiceCustomerInput, nil]
      optional :customer, -> { VatSense::InvoiceCustomerInput }

      # @!attribute has_vat
      #   Whether the invoice is subject to VAT.
      #
      #   @return [Boolean, nil]
      optional :has_vat, VatSense::Internal::Type::Boolean

      # @!attribute invoice_number
      #   A unique invoice number. If not provided, defaults to an auto-incremented
      #   number.
      #
      #   @return [String, nil]
      optional :invoice_number, String

      # @!attribute is_copy
      #   Whether the invoice is a copy of a primary invoice.
      #
      #   @return [Boolean, nil]
      optional :is_copy, VatSense::Internal::Type::Boolean

      # @!attribute is_reverse_charge
      #   Whether the invoice is zero-rated due to reverse charge.
      #
      #   @return [Boolean, nil]
      optional :is_reverse_charge, VatSense::Internal::Type::Boolean

      # @!attribute notes
      #   Any additional notes for the invoice.
      #
      #   @return [String, nil]
      optional :notes, String

      # @!attribute pad_invoice_number
      #   Pad the auto-generated invoice number with leading zeros to this length.
      #
      #   @return [Integer, nil]
      optional :pad_invoice_number, Integer

      # @!attribute serial
      #   A serial prepended to the auto-generated invoice number. Each unique serial has
      #   its own auto-increment range.
      #
      #   @return [String, nil]
      optional :serial, String

      # @!attribute tax_type
      #   Whether item prices include or exclude VAT.
      #
      #   @return [Symbol, VatSense::Models::CreateInvoice::TaxType, nil]
      optional :tax_type, enum: -> { VatSense::CreateInvoice::TaxType }

      # @!attribute type
      #   The type of invoice.
      #
      #   @return [Symbol, VatSense::Models::CreateInvoice::Type, nil]
      optional :type, enum: -> { VatSense::CreateInvoice::Type }

      # @!attribute zero_rated
      #   Whether the invoice has been zero-rated.
      #
      #   @return [Boolean, nil]
      optional :zero_rated, VatSense::Internal::Type::Boolean

      # @!method initialize(business:, currency_code:, date:, items:, tax_point:, conversion: nil, customer: nil, has_vat: nil, invoice_number: nil, is_copy: nil, is_reverse_charge: nil, notes: nil, pad_invoice_number: nil, serial: nil, tax_type: nil, type: nil, zero_rated: nil)
      #   Some parameter documentations has been truncated, see
      #   {VatSense::Models::CreateInvoice} for more details.
      #
      #   @param business [VatSense::Models::InvoiceBusinessInput]
      #
      #   @param currency_code [String] The 3-character currency code the invoice is billed in.
      #
      #   @param date [String] The date the invoice was issued (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      #   @param items [Array<VatSense::Models::Invoice::InvoiceItemInput>]
      #
      #   @param tax_point [String] The tax point or "time of supply" (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      #
      #   @param conversion [VatSense::Models::InvoiceConversionInput]
      #
      #   @param customer [VatSense::Models::InvoiceCustomerInput]
      #
      #   @param has_vat [Boolean] Whether the invoice is subject to VAT.
      #
      #   @param invoice_number [String] A unique invoice number. If not provided, defaults to an auto-incremented number
      #
      #   @param is_copy [Boolean] Whether the invoice is a copy of a primary invoice.
      #
      #   @param is_reverse_charge [Boolean] Whether the invoice is zero-rated due to reverse charge.
      #
      #   @param notes [String] Any additional notes for the invoice.
      #
      #   @param pad_invoice_number [Integer] Pad the auto-generated invoice number with leading zeros to this length.
      #
      #   @param serial [String] A serial prepended to the auto-generated invoice number. Each unique serial has
      #
      #   @param tax_type [Symbol, VatSense::Models::CreateInvoice::TaxType] Whether item prices include or exclude VAT.
      #
      #   @param type [Symbol, VatSense::Models::CreateInvoice::Type] The type of invoice.
      #
      #   @param zero_rated [Boolean] Whether the invoice has been zero-rated.

      # Whether item prices include or exclude VAT.
      #
      # @see VatSense::Models::CreateInvoice#tax_type
      module TaxType
        extend VatSense::Internal::Type::Enum

        INCL = :incl
        EXCL = :excl

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of invoice.
      #
      # @see VatSense::Models::CreateInvoice#type
      module Type
        extend VatSense::Internal::Type::Enum

        SALE = :sale
        REFUND = :refund

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

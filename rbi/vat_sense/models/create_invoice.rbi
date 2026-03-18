# typed: strong

module VatSense
  module Models
    class CreateInvoice < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(VatSense::CreateInvoice, VatSense::Internal::AnyHash)
        end

      sig { returns(VatSense::InvoiceBusinessInput) }
      attr_reader :business

      sig { params(business: VatSense::InvoiceBusinessInput::OrHash).void }
      attr_writer :business

      # The 3-character currency code the invoice is billed in.
      sig { returns(String) }
      attr_accessor :currency_code

      # The date the invoice was issued (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      sig { returns(String) }
      attr_accessor :date

      sig { returns(T::Array[VatSense::Invoice::InvoiceItemInput]) }
      attr_accessor :items

      # The tax point or "time of supply" (YYYY-MM-DD or YYYY-MM-DD HH:MM:SS).
      sig { returns(String) }
      attr_accessor :tax_point

      sig { returns(T.nilable(VatSense::InvoiceConversionInput)) }
      attr_reader :conversion

      sig { params(conversion: VatSense::InvoiceConversionInput::OrHash).void }
      attr_writer :conversion

      sig { returns(T.nilable(VatSense::InvoiceCustomerInput)) }
      attr_reader :customer

      sig { params(customer: VatSense::InvoiceCustomerInput::OrHash).void }
      attr_writer :customer

      # Whether the invoice is subject to VAT.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_vat

      sig { params(has_vat: T::Boolean).void }
      attr_writer :has_vat

      # A unique invoice number. If not provided, defaults to an auto-incremented
      # number.
      sig { returns(T.nilable(String)) }
      attr_reader :invoice_number

      sig { params(invoice_number: String).void }
      attr_writer :invoice_number

      # Whether the invoice is a copy of a primary invoice.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_copy

      sig { params(is_copy: T::Boolean).void }
      attr_writer :is_copy

      # Whether the invoice is zero-rated due to reverse charge.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_reverse_charge

      sig { params(is_reverse_charge: T::Boolean).void }
      attr_writer :is_reverse_charge

      # Any additional notes for the invoice.
      sig { returns(T.nilable(String)) }
      attr_reader :notes

      sig { params(notes: String).void }
      attr_writer :notes

      # Pad the auto-generated invoice number with leading zeros to this length.
      sig { returns(T.nilable(Integer)) }
      attr_reader :pad_invoice_number

      sig { params(pad_invoice_number: Integer).void }
      attr_writer :pad_invoice_number

      # A serial prepended to the auto-generated invoice number. Each unique serial has
      # its own auto-increment range.
      sig { returns(T.nilable(String)) }
      attr_reader :serial

      sig { params(serial: String).void }
      attr_writer :serial

      # Whether item prices include or exclude VAT.
      sig { returns(T.nilable(VatSense::CreateInvoice::TaxType::OrSymbol)) }
      attr_reader :tax_type

      sig { params(tax_type: VatSense::CreateInvoice::TaxType::OrSymbol).void }
      attr_writer :tax_type

      # The type of invoice.
      sig { returns(T.nilable(VatSense::CreateInvoice::Type::OrSymbol)) }
      attr_reader :type

      sig { params(type: VatSense::CreateInvoice::Type::OrSymbol).void }
      attr_writer :type

      # Whether the invoice has been zero-rated.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :zero_rated

      sig { params(zero_rated: T::Boolean).void }
      attr_writer :zero_rated

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
          zero_rated: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
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
        zero_rated: nil
      )
      end

      sig do
        override.returns(
          {
            business: VatSense::InvoiceBusinessInput,
            currency_code: String,
            date: String,
            items: T::Array[VatSense::Invoice::InvoiceItemInput],
            tax_point: String,
            conversion: VatSense::InvoiceConversionInput,
            customer: VatSense::InvoiceCustomerInput,
            has_vat: T::Boolean,
            invoice_number: String,
            is_copy: T::Boolean,
            is_reverse_charge: T::Boolean,
            notes: String,
            pad_invoice_number: Integer,
            serial: String,
            tax_type: VatSense::CreateInvoice::TaxType::OrSymbol,
            type: VatSense::CreateInvoice::Type::OrSymbol,
            zero_rated: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Whether item prices include or exclude VAT.
      module TaxType
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::CreateInvoice::TaxType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCL = T.let(:incl, VatSense::CreateInvoice::TaxType::TaggedSymbol)
        EXCL = T.let(:excl, VatSense::CreateInvoice::TaxType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[VatSense::CreateInvoice::TaxType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of invoice.
      module Type
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::CreateInvoice::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SALE = T.let(:sale, VatSense::CreateInvoice::Type::TaggedSymbol)
        REFUND = T.let(:refund, VatSense::CreateInvoice::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[VatSense::CreateInvoice::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

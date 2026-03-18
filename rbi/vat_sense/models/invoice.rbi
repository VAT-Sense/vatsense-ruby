# typed: strong

module VatSense
  module Models
    class InvoiceAPI < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(VatSense::InvoiceAPI, VatSense::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(VatSense::InvoiceAPI::Business)) }
      attr_reader :business

      sig { params(business: VatSense::InvoiceAPI::Business::OrHash).void }
      attr_writer :business

      sig { returns(T.nilable(VatSense::InvoiceConversionInput)) }
      attr_reader :conversion

      sig do
        params(
          conversion: T.nilable(VatSense::InvoiceConversionInput::OrHash)
        ).void
      end
      attr_writer :conversion

      sig { returns(T.nilable(Time)) }
      attr_reader :created

      sig { params(created: Time).void }
      attr_writer :created

      sig { returns(T.nilable(String)) }
      attr_reader :currency_code

      sig { params(currency_code: String).void }
      attr_writer :currency_code

      sig { returns(T.nilable(VatSense::InvoiceAPI::Customer)) }
      attr_reader :customer

      sig do
        params(customer: T.nilable(VatSense::InvoiceAPI::Customer::OrHash)).void
      end
      attr_writer :customer

      sig { returns(T.nilable(String)) }
      attr_reader :date

      sig { params(date: String).void }
      attr_writer :date

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_vat

      sig { params(has_vat: T::Boolean).void }
      attr_writer :has_vat

      sig { returns(T.nilable(String)) }
      attr_reader :invoice_number

      sig { params(invoice_number: String).void }
      attr_writer :invoice_number

      # Unique URL to view the invoice. Append "/pdf" to download a PDF copy.
      sig { returns(T.nilable(String)) }
      attr_reader :invoice_url

      sig { params(invoice_url: String).void }
      attr_writer :invoice_url

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_copy

      sig { params(is_copy: T::Boolean).void }
      attr_writer :is_copy

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_reverse_charge

      sig { params(is_reverse_charge: T::Boolean).void }
      attr_writer :is_reverse_charge

      sig { returns(T.nilable(T::Array[VatSense::Invoice::InvoiceItem])) }
      attr_reader :items

      sig do
        params(items: T::Array[VatSense::Invoice::InvoiceItem::OrHash]).void
      end
      attr_writer :items

      sig { returns(T.nilable(String)) }
      attr_accessor :notes

      sig { returns(T.nilable(Integer)) }
      attr_reader :num_items

      sig { params(num_items: Integer).void }
      attr_writer :num_items

      sig { returns(T.nilable(VatSense::InvoiceAPI::Object::TaggedSymbol)) }
      attr_reader :object

      sig { params(object: VatSense::InvoiceAPI::Object::OrSymbol).void }
      attr_writer :object

      sig { returns(T.nilable(String)) }
      attr_reader :tax_point

      sig { params(tax_point: String).void }
      attr_writer :tax_point

      sig { returns(T.nilable(VatSense::InvoiceAPI::TaxType::TaggedSymbol)) }
      attr_reader :tax_type

      sig { params(tax_type: VatSense::InvoiceAPI::TaxType::OrSymbol).void }
      attr_writer :tax_type

      sig { returns(T.nilable(VatSense::InvoiceAPI::Totals)) }
      attr_reader :totals

      sig { params(totals: VatSense::InvoiceAPI::Totals::OrHash).void }
      attr_writer :totals

      sig { returns(T.nilable(VatSense::InvoiceAPI::Type::TaggedSymbol)) }
      attr_reader :type

      sig { params(type: VatSense::InvoiceAPI::Type::OrSymbol).void }
      attr_writer :type

      sig { returns(T.nilable(Time)) }
      attr_reader :updated

      sig { params(updated: Time).void }
      attr_writer :updated

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :zero_rated

      sig { params(zero_rated: T::Boolean).void }
      attr_writer :zero_rated

      sig do
        params(
          id: String,
          business: VatSense::InvoiceAPI::Business::OrHash,
          conversion: T.nilable(VatSense::InvoiceConversionInput::OrHash),
          created: Time,
          currency_code: String,
          customer: T.nilable(VatSense::InvoiceAPI::Customer::OrHash),
          date: String,
          has_vat: T::Boolean,
          invoice_number: String,
          invoice_url: String,
          is_copy: T::Boolean,
          is_reverse_charge: T::Boolean,
          items: T::Array[VatSense::Invoice::InvoiceItem::OrHash],
          notes: T.nilable(String),
          num_items: Integer,
          object: VatSense::InvoiceAPI::Object::OrSymbol,
          tax_point: String,
          tax_type: VatSense::InvoiceAPI::TaxType::OrSymbol,
          totals: VatSense::InvoiceAPI::Totals::OrHash,
          type: VatSense::InvoiceAPI::Type::OrSymbol,
          updated: Time,
          zero_rated: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        business: nil,
        conversion: nil,
        created: nil,
        currency_code: nil,
        customer: nil,
        date: nil,
        has_vat: nil,
        invoice_number: nil,
        # Unique URL to view the invoice. Append "/pdf" to download a PDF copy.
        invoice_url: nil,
        is_copy: nil,
        is_reverse_charge: nil,
        items: nil,
        notes: nil,
        num_items: nil,
        object: nil,
        tax_point: nil,
        tax_type: nil,
        totals: nil,
        type: nil,
        updated: nil,
        zero_rated: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            business: VatSense::InvoiceAPI::Business,
            conversion: T.nilable(VatSense::InvoiceConversionInput),
            created: Time,
            currency_code: String,
            customer: T.nilable(VatSense::InvoiceAPI::Customer),
            date: String,
            has_vat: T::Boolean,
            invoice_number: String,
            invoice_url: String,
            is_copy: T::Boolean,
            is_reverse_charge: T::Boolean,
            items: T::Array[VatSense::Invoice::InvoiceItem],
            notes: T.nilable(String),
            num_items: Integer,
            object: VatSense::InvoiceAPI::Object::TaggedSymbol,
            tax_point: String,
            tax_type: VatSense::InvoiceAPI::TaxType::TaggedSymbol,
            totals: VatSense::InvoiceAPI::Totals,
            type: VatSense::InvoiceAPI::Type::TaggedSymbol,
            updated: Time,
            zero_rated: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Business < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(VatSense::InvoiceAPI::Business, VatSense::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :address

        sig { params(address: String).void }
        attr_writer :address

        sig { returns(T.nilable(String)) }
        attr_reader :company_number

        sig { params(company_number: String).void }
        attr_writer :company_number

        sig { returns(T.nilable(String)) }
        attr_accessor :logo

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :vat_number

        sig { params(vat_number: String).void }
        attr_writer :vat_number

        sig do
          params(
            address: String,
            company_number: String,
            logo: T.nilable(String),
            name: String,
            vat_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          address: nil,
          company_number: nil,
          logo: nil,
          name: nil,
          vat_number: nil
        )
        end

        sig do
          override.returns(
            {
              address: String,
              company_number: String,
              logo: T.nilable(String),
              name: String,
              vat_number: String
            }
          )
        end
        def to_hash
        end
      end

      class Customer < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(VatSense::InvoiceAPI::Customer, VatSense::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :address

        sig { params(address: String).void }
        attr_writer :address

        sig { returns(T.nilable(String)) }
        attr_reader :company_number

        sig { params(company_number: String).void }
        attr_writer :company_number

        sig { returns(T.nilable(String)) }
        attr_accessor :logo

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :vat_number

        sig { params(vat_number: String).void }
        attr_writer :vat_number

        sig do
          params(
            address: String,
            company_number: String,
            logo: T.nilable(String),
            name: String,
            vat_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          address: nil,
          company_number: nil,
          logo: nil,
          name: nil,
          vat_number: nil
        )
        end

        sig do
          override.returns(
            {
              address: String,
              company_number: String,
              logo: T.nilable(String),
              name: String,
              vat_number: String
            }
          )
        end
        def to_hash
        end
      end

      module Object
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::InvoiceAPI::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVOICE = T.let(:invoice, VatSense::InvoiceAPI::Object::TaggedSymbol)

        sig do
          override.returns(T::Array[VatSense::InvoiceAPI::Object::TaggedSymbol])
        end
        def self.values
        end
      end

      module TaxType
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::InvoiceAPI::TaxType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCL = T.let(:incl, VatSense::InvoiceAPI::TaxType::TaggedSymbol)
        EXCL = T.let(:excl, VatSense::InvoiceAPI::TaxType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[VatSense::InvoiceAPI::TaxType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Totals < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(VatSense::InvoiceAPI::Totals, VatSense::Internal::AnyHash)
          end

        # Total discount amount.
        sig { returns(T.nilable(Float)) }
        attr_reader :discount

        sig { params(discount: Float).void }
        attr_writer :discount

        # Total before VAT.
        sig { returns(T.nilable(Float)) }
        attr_reader :subtotal

        sig { params(subtotal: Float).void }
        attr_writer :subtotal

        # Grand total.
        sig { returns(T.nilable(Float)) }
        attr_reader :total

        sig { params(total: Float).void }
        attr_writer :total

        # Total VAT amount.
        sig { returns(T.nilable(Float)) }
        attr_reader :vat

        sig { params(vat: Float).void }
        attr_writer :vat

        sig do
          params(
            discount: Float,
            subtotal: Float,
            total: Float,
            vat: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Total discount amount.
          discount: nil,
          # Total before VAT.
          subtotal: nil,
          # Grand total.
          total: nil,
          # Total VAT amount.
          vat: nil
        )
        end

        sig do
          override.returns(
            { discount: Float, subtotal: Float, total: Float, vat: Float }
          )
        end
        def to_hash
        end
      end

      module Type
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::InvoiceAPI::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SALE = T.let(:sale, VatSense::InvoiceAPI::Type::TaggedSymbol)
        REFUND = T.let(:refund, VatSense::InvoiceAPI::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[VatSense::InvoiceAPI::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end

# frozen_string_literal: true

module VatSense
  module Models
    class InvoiceAPI < VatSense::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute business
      #
      #   @return [VatSense::Models::InvoiceAPI::Business, nil]
      optional :business, -> { VatSense::InvoiceAPI::Business }

      # @!attribute conversion
      #
      #   @return [VatSense::Models::InvoiceConversionInput, nil]
      optional :conversion, -> { VatSense::InvoiceConversionInput }, nil?: true

      # @!attribute created
      #
      #   @return [Time, nil]
      optional :created, Time

      # @!attribute currency_code
      #
      #   @return [String, nil]
      optional :currency_code, String

      # @!attribute customer
      #
      #   @return [VatSense::Models::InvoiceAPI::Customer, nil]
      optional :customer, -> { VatSense::InvoiceAPI::Customer }, nil?: true

      # @!attribute date
      #
      #   @return [String, nil]
      optional :date, String

      # @!attribute has_vat
      #
      #   @return [Boolean, nil]
      optional :has_vat, VatSense::Internal::Type::Boolean

      # @!attribute invoice_number
      #
      #   @return [String, nil]
      optional :invoice_number, String

      # @!attribute invoice_url
      #   Unique URL to view the invoice. Append "/pdf" to download a PDF copy.
      #
      #   @return [String, nil]
      optional :invoice_url, String

      # @!attribute is_copy
      #
      #   @return [Boolean, nil]
      optional :is_copy, VatSense::Internal::Type::Boolean

      # @!attribute is_reverse_charge
      #
      #   @return [Boolean, nil]
      optional :is_reverse_charge, VatSense::Internal::Type::Boolean

      # @!attribute items
      #
      #   @return [Array<VatSense::Models::Invoice::InvoiceItem>, nil]
      optional :items, -> { VatSense::Internal::Type::ArrayOf[VatSense::Invoice::InvoiceItem] }

      # @!attribute notes
      #
      #   @return [String, nil]
      optional :notes, String, nil?: true

      # @!attribute num_items
      #
      #   @return [Integer, nil]
      optional :num_items, Integer

      # @!attribute object
      #
      #   @return [Symbol, VatSense::Models::InvoiceAPI::Object, nil]
      optional :object, enum: -> { VatSense::InvoiceAPI::Object }

      # @!attribute tax_point
      #
      #   @return [String, nil]
      optional :tax_point, String

      # @!attribute tax_type
      #
      #   @return [Symbol, VatSense::Models::InvoiceAPI::TaxType, nil]
      optional :tax_type, enum: -> { VatSense::InvoiceAPI::TaxType }

      # @!attribute totals
      #
      #   @return [VatSense::Models::InvoiceAPI::Totals, nil]
      optional :totals, -> { VatSense::InvoiceAPI::Totals }

      # @!attribute type
      #
      #   @return [Symbol, VatSense::Models::InvoiceAPI::Type, nil]
      optional :type, enum: -> { VatSense::InvoiceAPI::Type }

      # @!attribute updated
      #
      #   @return [Time, nil]
      optional :updated, Time

      # @!attribute zero_rated
      #
      #   @return [Boolean, nil]
      optional :zero_rated, VatSense::Internal::Type::Boolean

      # @!method initialize(id: nil, business: nil, conversion: nil, created: nil, currency_code: nil, customer: nil, date: nil, has_vat: nil, invoice_number: nil, invoice_url: nil, is_copy: nil, is_reverse_charge: nil, items: nil, notes: nil, num_items: nil, object: nil, tax_point: nil, tax_type: nil, totals: nil, type: nil, updated: nil, zero_rated: nil)
      #   @param id [String]
      #
      #   @param business [VatSense::Models::InvoiceAPI::Business]
      #
      #   @param conversion [VatSense::Models::InvoiceConversionInput, nil]
      #
      #   @param created [Time]
      #
      #   @param currency_code [String]
      #
      #   @param customer [VatSense::Models::InvoiceAPI::Customer, nil]
      #
      #   @param date [String]
      #
      #   @param has_vat [Boolean]
      #
      #   @param invoice_number [String]
      #
      #   @param invoice_url [String] Unique URL to view the invoice. Append "/pdf" to download a PDF copy.
      #
      #   @param is_copy [Boolean]
      #
      #   @param is_reverse_charge [Boolean]
      #
      #   @param items [Array<VatSense::Models::Invoice::InvoiceItem>]
      #
      #   @param notes [String, nil]
      #
      #   @param num_items [Integer]
      #
      #   @param object [Symbol, VatSense::Models::InvoiceAPI::Object]
      #
      #   @param tax_point [String]
      #
      #   @param tax_type [Symbol, VatSense::Models::InvoiceAPI::TaxType]
      #
      #   @param totals [VatSense::Models::InvoiceAPI::Totals]
      #
      #   @param type [Symbol, VatSense::Models::InvoiceAPI::Type]
      #
      #   @param updated [Time]
      #
      #   @param zero_rated [Boolean]

      # @see VatSense::Models::InvoiceAPI#business
      class Business < VatSense::Internal::Type::BaseModel
        # @!attribute address
        #
        #   @return [String, nil]
        optional :address, String

        # @!attribute company_number
        #
        #   @return [String, nil]
        optional :company_number, String

        # @!attribute logo
        #
        #   @return [String, nil]
        optional :logo, String, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute vat_number
        #
        #   @return [String, nil]
        optional :vat_number, String

        # @!method initialize(address: nil, company_number: nil, logo: nil, name: nil, vat_number: nil)
        #   @param address [String]
        #   @param company_number [String]
        #   @param logo [String, nil]
        #   @param name [String]
        #   @param vat_number [String]
      end

      # @see VatSense::Models::InvoiceAPI#customer
      class Customer < VatSense::Internal::Type::BaseModel
        # @!attribute address
        #
        #   @return [String, nil]
        optional :address, String

        # @!attribute company_number
        #
        #   @return [String, nil]
        optional :company_number, String

        # @!attribute logo
        #
        #   @return [String, nil]
        optional :logo, String, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute vat_number
        #
        #   @return [String, nil]
        optional :vat_number, String

        # @!method initialize(address: nil, company_number: nil, logo: nil, name: nil, vat_number: nil)
        #   @param address [String]
        #   @param company_number [String]
        #   @param logo [String, nil]
        #   @param name [String]
        #   @param vat_number [String]
      end

      # @see VatSense::Models::InvoiceAPI#object
      module Object
        extend VatSense::Internal::Type::Enum

        INVOICE = :invoice

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see VatSense::Models::InvoiceAPI#tax_type
      module TaxType
        extend VatSense::Internal::Type::Enum

        INCL = :incl
        EXCL = :excl

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see VatSense::Models::InvoiceAPI#totals
      class Totals < VatSense::Internal::Type::BaseModel
        # @!attribute discount
        #   Total discount amount.
        #
        #   @return [Float, nil]
        optional :discount, Float

        # @!attribute subtotal
        #   Total before VAT.
        #
        #   @return [Float, nil]
        optional :subtotal, Float

        # @!attribute total
        #   Grand total.
        #
        #   @return [Float, nil]
        optional :total, Float

        # @!attribute vat
        #   Total VAT amount.
        #
        #   @return [Float, nil]
        optional :vat, Float

        # @!method initialize(discount: nil, subtotal: nil, total: nil, vat: nil)
        #   @param discount [Float] Total discount amount.
        #
        #   @param subtotal [Float] Total before VAT.
        #
        #   @param total [Float] Grand total.
        #
        #   @param vat [Float] Total VAT amount.
      end

      # @see VatSense::Models::InvoiceAPI#type
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

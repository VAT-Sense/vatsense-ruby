# frozen_string_literal: true

module Vatsense
  module Models
    module Invoice
      class InvoiceItem < Vatsense::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute discount_rate
        #
        #   @return [Float, nil]
        optional :discount_rate, Float, nil?: true

        # @!attribute item
        #
        #   @return [String, nil]
        optional :item, String

        # @!attribute object
        #
        #   @return [Symbol, Vatsense::Models::Invoice::InvoiceItem::Object, nil]
        optional :object, enum: -> { Vatsense::Invoice::InvoiceItem::Object }

        # @!attribute price_each
        #
        #   @return [Float, nil]
        optional :price_each, Float

        # @!attribute price_total
        #
        #   @return [Float, nil]
        optional :price_total, Float

        # @!attribute quantity
        #
        #   @return [Float, nil]
        optional :quantity, Float

        # @!attribute vat_rate
        #
        #   @return [Float, nil]
        optional :vat_rate, Float

        # @!method initialize(id: nil, discount_rate: nil, item: nil, object: nil, price_each: nil, price_total: nil, quantity: nil, vat_rate: nil)
        #   @param id [String]
        #   @param discount_rate [Float, nil]
        #   @param item [String]
        #   @param object [Symbol, Vatsense::Models::Invoice::InvoiceItem::Object]
        #   @param price_each [Float]
        #   @param price_total [Float]
        #   @param quantity [Float]
        #   @param vat_rate [Float]

        # @see Vatsense::Models::Invoice::InvoiceItem#object
        module Object
          extend Vatsense::Internal::Type::Enum

          ITEM = :item

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    InvoiceItem = Invoice::InvoiceItem
  end
end

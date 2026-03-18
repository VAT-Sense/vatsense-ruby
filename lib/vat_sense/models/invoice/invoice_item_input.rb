# frozen_string_literal: true

module VatSense
  module Models
    module Invoice
      class InvoiceItemInput < VatSense::Internal::Type::BaseModel
        # @!attribute item
        #   The description of the line item.
        #
        #   @return [String]
        required :item, String

        # @!attribute price_each
        #   The price per item. Must be a decimal with 2 decimal places.
        #
        #   @return [Float]
        required :price_each, Float

        # @!attribute quantity
        #   The quantity of the item.
        #
        #   @return [Float]
        required :quantity, Float

        # @!attribute vat_rate
        #   A percentage VAT rate for this item.
        #
        #   @return [Float]
        required :vat_rate, Float

        # @!attribute discount_rate
        #   A percentage discount to apply to the price.
        #
        #   @return [Float, nil]
        optional :discount_rate, Float

        # @!method initialize(item:, price_each:, quantity:, vat_rate:, discount_rate: nil)
        #   @param item [String] The description of the line item.
        #
        #   @param price_each [Float] The price per item. Must be a decimal with 2 decimal places.
        #
        #   @param quantity [Float] The quantity of the item.
        #
        #   @param vat_rate [Float] A percentage VAT rate for this item.
        #
        #   @param discount_rate [Float] A percentage discount to apply to the price.
      end
    end

    InvoiceItemInput = Invoice::InvoiceItemInput
  end
end

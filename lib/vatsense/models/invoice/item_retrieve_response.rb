# frozen_string_literal: true

module Vatsense
  module Models
    module Invoice
      # @see Vatsense::Resources::Invoice::Item#retrieve
      class ItemRetrieveResponse < Vatsense::Internal::Type::BaseModel
        # @!attribute code
        #
        #   @return [Integer, nil]
        optional :code, Integer

        # @!attribute data
        #
        #   @return [Vatsense::Models::Invoice::InvoiceItem, nil]
        optional :data, -> { Vatsense::Invoice::InvoiceItem }

        # @!attribute success
        #
        #   @return [Boolean, nil]
        optional :success, Vatsense::Internal::Type::Boolean

        # @!method initialize(code: nil, data: nil, success: nil)
        #   @param code [Integer]
        #   @param data [Vatsense::Models::Invoice::InvoiceItem]
        #   @param success [Boolean]
      end
    end
  end
end

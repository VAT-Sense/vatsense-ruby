# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Invoice#create
    class InvoiceResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::InvoiceAPI, nil]
      optional :data, -> { Vatsense::InvoiceAPI }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::InvoiceAPI]
      #   @param success [Boolean]
    end
  end
end

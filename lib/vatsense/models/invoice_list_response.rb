# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Invoice#list
    class InvoiceListResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<Vatsense::Models::InvoiceAPI>, nil]
      optional :data, -> { Vatsense::Internal::Type::ArrayOf[Vatsense::InvoiceAPI] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<Vatsense::Models::InvoiceAPI>]
      #   @param success [Boolean]
    end
  end
end

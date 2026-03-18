# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Invoice#delete
    class InvoiceDeleteResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code:, success:)
      #   @param code [Integer]
      #   @param success [Boolean]
    end
  end
end

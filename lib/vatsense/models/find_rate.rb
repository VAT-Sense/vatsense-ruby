# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Rates#details
    class FindRate < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::RateWithTaxRate, nil]
      optional :data, -> { Vatsense::RateWithTaxRate }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::RateWithTaxRate]
      #   @param success [Boolean]
    end
  end
end

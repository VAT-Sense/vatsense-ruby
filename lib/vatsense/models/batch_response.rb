# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Batches
    class BatchResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::Batch]
      required :data, -> { Vatsense::Models::Batch }

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Vatsense::Internal::Type::Boolean
    end
  end
end

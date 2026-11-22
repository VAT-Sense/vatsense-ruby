# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Batches
    class BatchDeleteResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::BatchDeleteResponse::Data]
      required :data, -> { Vatsense::Models::BatchDeleteResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Vatsense::Internal::Type::Boolean

      # @see Vatsense::Models::BatchDeleteResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute deleted
        #
        #   @return [Boolean]
        required :deleted, Vatsense::Internal::Type::Boolean

        # @!attribute object
        #
        #   @return [String, nil]
        optional :object, String, nil?: true
      end
    end
  end
end

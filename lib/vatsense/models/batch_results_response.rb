# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Batches
    class BatchResultsResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::BatchResultsResponse::Data]
      required :data, -> { Vatsense::Models::BatchResultsResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Vatsense::Internal::Type::Boolean

      # @see Vatsense::Models::BatchResultsResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<Vatsense::Models::BatchResult>]
        required :data, -> { Vatsense::Internal::Type::ArrayOf[Vatsense::Models::BatchResult] }

        # @!attribute has_more
        #
        #   @return [Boolean]
        required :has_more, Vatsense::Internal::Type::Boolean

        # @!attribute next_after
        #   Pass as `after:` for the next page while `has_more` is true.
        #
        #   @return [Integer, nil]
        optional :next_after, Integer, nil?: true
      end
    end
  end
end

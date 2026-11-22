# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Batches
    class BatchListResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::BatchListResponse::Data]
      required :data, -> { Vatsense::Models::BatchListResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Vatsense::Internal::Type::Boolean

      # @see Vatsense::Models::BatchListResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<Vatsense::Models::Batch>]
        required :data, -> { Vatsense::Internal::Type::ArrayOf[Vatsense::Models::Batch] }

        # @!attribute has_more
        #
        #   @return [Boolean]
        required :has_more, Vatsense::Internal::Type::Boolean

        # @!attribute limit
        #
        #   @return [Integer, nil]
        optional :limit, Integer, nil?: true

        # @!attribute page
        #
        #   @return [Integer, nil]
        optional :page, Integer, nil?: true

        # @!attribute total
        #
        #   @return [Integer, nil]
        optional :total, Integer, nil?: true
      end
    end
  end
end

# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Usage#retrieve
    class UsageRetrieveResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::UsageRetrieveResponse::Data, nil]
      optional :data, -> { Vatsense::Models::UsageRetrieveResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::UsageRetrieveResponse::Data]
      #   @param success [Boolean]

      # @see Vatsense::Models::UsageRetrieveResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute requests
        #
        #   @return [Vatsense::Models::UsageRetrieveResponse::Data::Requests, nil]
        optional :requests, -> { Vatsense::Models::UsageRetrieveResponse::Data::Requests }

        # @!method initialize(requests: nil)
        #   @param requests [Vatsense::Models::UsageRetrieveResponse::Data::Requests]

        # @see Vatsense::Models::UsageRetrieveResponse::Data#requests
        class Requests < Vatsense::Internal::Type::BaseModel
          # @!attribute remaining
          #   Requests remaining before the limit is reached.
          #
          #   @return [Integer, nil]
          optional :remaining, Integer

          # @!attribute total
          #   Total requests allowed on your plan.
          #
          #   @return [Integer, nil]
          optional :total, Integer

          # @!attribute used
          #   Requests used in the last 30 days.
          #
          #   @return [Integer, nil]
          optional :used, Integer

          # @!method initialize(remaining: nil, total: nil, used: nil)
          #   @param remaining [Integer] Requests remaining before the limit is reached.
          #
          #   @param total [Integer] Total requests allowed on your plan.
          #
          #   @param used [Integer] Requests used in the last 30 days.
        end
      end
    end
  end
end

# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Usage#retrieve
    class UsageRetrieveResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [VatSense::Models::UsageRetrieveResponse::Data, nil]
      optional :data, -> { VatSense::Models::UsageRetrieveResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [VatSense::Models::UsageRetrieveResponse::Data]
      #   @param success [Boolean]

      # @see VatSense::Models::UsageRetrieveResponse#data
      class Data < VatSense::Internal::Type::BaseModel
        # @!attribute requests
        #
        #   @return [VatSense::Models::UsageRetrieveResponse::Data::Requests, nil]
        optional :requests, -> { VatSense::Models::UsageRetrieveResponse::Data::Requests }

        # @!method initialize(requests: nil)
        #   @param requests [VatSense::Models::UsageRetrieveResponse::Data::Requests]

        # @see VatSense::Models::UsageRetrieveResponse::Data#requests
        class Requests < VatSense::Internal::Type::BaseModel
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

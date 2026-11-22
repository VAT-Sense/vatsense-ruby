# frozen_string_literal: true

module Vatsense
  module Models
    # A batch of VAT numbers checked together.
    class Batch < Vatsense::Internal::Type::BaseModel
      # @!attribute id
      #   The batch's 26-character id.
      #
      #   @return [String]
      required :id, String

      # @!attribute object
      #   Always `batch`.
      #
      #   @return [String, nil]
      optional :object, String, nil?: true

      # @!attribute auto_continue
      #
      #   @return [Boolean, nil]
      optional :auto_continue, Vatsense::Internal::Type::Boolean, nil?: true

      # @!attribute consultation
      #
      #   @return [Boolean, nil]
      optional :consultation, Vatsense::Internal::Type::Boolean, nil?: true

      # @!attribute created_at
      #   When the batch was made. Times are UTC, ISO 8601.
      #
      #   @return [String, nil]
      optional :created_at, String, nil?: true

      # @!attribute dashboard_url
      #   The batch's page in the dashboard; nil for a test batch.
      #
      #   @return [String, nil]
      optional :dashboard_url, String, nil?: true

      # @!attribute estimated_finish_at
      #
      #   @return [String, nil]
      optional :estimated_finish_at, String, nil?: true

      # @!attribute expires_at
      #
      #   @return [String, nil]
      optional :expires_at, String, nil?: true

      # @!attribute finished_at
      #
      #   @return [String, nil]
      optional :finished_at, String, nil?: true

      # @!attribute livemode
      #   False for a test batch, made with a test key.
      #
      #   @return [Boolean, nil]
      optional :livemode, Vatsense::Internal::Type::Boolean, nil?: true

      # @!attribute number
      #
      #   @return [Integer, nil]
      optional :number, Integer, nil?: true

      # @!attribute pause_reason
      #
      #   @return [String, nil]
      optional :pause_reason, String, nil?: true

      # @!attribute quote
      #   For drafts and paused batches.
      #
      #   @return [Vatsense::Models::Batch::Quote, nil]
      optional :quote, -> { Vatsense::Models::Batch::Quote }, nil?: true

      # @!attribute reference
      #
      #   @return [String, nil]
      optional :reference, String, nil?: true

      # @!attribute requests_used
      #
      #   @return [Integer, nil]
      optional :requests_used, Integer, nil?: true

      # @!attribute results
      #
      #   @return [Vatsense::Models::Batch::Results, nil]
      optional :results, -> { Vatsense::Models::Batch::Results }, nil?: true

      # @!attribute rows
      #
      #   @return [Vatsense::Models::Batch::Rows, nil]
      optional :rows, -> { Vatsense::Models::Batch::Rows }, nil?: true

      # @!attribute source
      #
      #   @return [String, nil]
      optional :source, String, nil?: true

      # @!attribute started_at
      #
      #   @return [String, nil]
      optional :started_at, String, nil?: true

      # @!attribute status
      #   `draft`, `queued`, `processing`, `paused`, `complete` or `expired`.
      #
      #   @return [String, nil]
      optional :status, String, nil?: true

      # @!attribute trial
      #
      #   @return [Boolean, nil]
      optional :trial, Vatsense::Internal::Type::Boolean, nil?: true

      # @!attribute uses_overage
      #
      #   @return [Boolean, nil]
      optional :uses_overage, Vatsense::Internal::Type::Boolean, nil?: true

      # @see Vatsense::Models::Batch#rows
      class Rows < Vatsense::Internal::Type::BaseModel
        # @!attribute done
        #   Rows checked so far.
        #
        #   @return [Integer, nil]
        optional :done, Integer, nil?: true

        # @!attribute to_check
        #   Rows that will be sent for checking.
        #
        #   @return [Integer, nil]
        optional :to_check, Integer, nil?: true

        # @!attribute total
        #   Rows in the batch.
        #
        #   @return [Integer, nil]
        optional :total, Integer, nil?: true
      end

      # @see Vatsense::Models::Batch#results
      class Results < Vatsense::Internal::Type::BaseModel
        # @!attribute duplicate
        #
        #   @return [Integer, nil]
        optional :duplicate, Integer, nil?: true

        # @!attribute invalid
        #
        #   @return [Integer, nil]
        optional :invalid, Integer, nil?: true

        # @!attribute not_checked
        #
        #   @return [Integer, nil]
        optional :not_checked, Integer, nil?: true

        # @!attribute repaired
        #
        #   @return [Integer, nil]
        optional :repaired, Integer, nil?: true

        # @!attribute retrying
        #
        #   @return [Integer, nil]
        optional :retrying, Integer, nil?: true

        # @!attribute unsupported
        #
        #   @return [Integer, nil]
        optional :unsupported, Integer, nil?: true

        # @!attribute valid
        #
        #   @return [Integer, nil]
        optional :valid, Integer, nil?: true
      end

      # @see Vatsense::Models::Batch#quote
      class Quote < Vatsense::Internal::Type::BaseModel
        # @!attribute covered
        #   Whether the requests left cover the batch.
        #
        #   @return [Boolean, nil]
        optional :covered, Vatsense::Internal::Type::Boolean, nil?: true

        # @!attribute overage_on
        #
        #   @return [Boolean, nil]
        optional :overage_on, Vatsense::Internal::Type::Boolean, nil?: true

        # @!attribute renews_at
        #
        #   @return [String, nil]
        optional :renews_at, String, nil?: true

        # @!attribute requests_left
        #
        #   @return [Integer, nil]
        optional :requests_left, Integer, nil?: true

        # @!attribute requests_needed
        #
        #   @return [Integer, nil]
        optional :requests_needed, Integer, nil?: true

        # @!attribute shortfall
        #
        #   @return [Integer, nil]
        optional :shortfall, Integer, nil?: true
      end
    end
  end
end

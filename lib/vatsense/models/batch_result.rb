# frozen_string_literal: true

module Vatsense
  module Models
    # One checked row of a batch, as the CSV report lists it.
    class BatchResult < Vatsense::Internal::Type::BaseModel
      # @!attribute row
      #
      #   @return [Integer]
      required :row, Integer

      # @!attribute authority
      #
      #   @return [String, nil]
      optional :authority, String, nil?: true

      # @!attribute checked_at
      #
      #   @return [String, nil]
      optional :checked_at, String, nil?: true

      # @!attribute company_address
      #
      #   @return [String, nil]
      optional :company_address, String, nil?: true

      # @!attribute company_name
      #
      #   @return [String, nil]
      optional :company_name, String, nil?: true

      # @!attribute confirmation_number
      #
      #   @return [String, nil]
      optional :confirmation_number, String, nil?: true

      # @!attribute consultation_number
      #
      #   @return [String, nil]
      optional :consultation_number, String, nil?: true

      # @!attribute country_code
      #
      #   @return [String, nil]
      optional :country_code, String, nil?: true

      # @!attribute country_uploaded
      #
      #   @return [String, nil]
      optional :country_uploaded, String, nil?: true

      # @!attribute duplicate_of_row
      #
      #   @return [Integer, nil]
      optional :duplicate_of_row, Integer, nil?: true

      # @!attribute match
      #
      #   @return [Vatsense::Models::BatchResult::Match, nil]
      optional :match, -> { Vatsense::Models::BatchResult::Match }, nil?: true

      # @!attribute reason
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute repaired
      #
      #   @return [Boolean, nil]
      optional :repaired, Vatsense::Internal::Type::Boolean, nil?: true

      # @!attribute result
      #   Such as `valid` or `invalid`; `pending` while the row is being checked.
      #
      #   @return [String, nil]
      optional :result, String, nil?: true

      # @!attribute vat_number
      #   The number as it was checked.
      #
      #   @return [String, nil]
      optional :vat_number, String, nil?: true

      # @!attribute vat_number_uploaded
      #
      #   @return [String, nil]
      optional :vat_number_uploaded, String, nil?: true

      # @see Vatsense::Models::BatchResult#match
      class Match < Vatsense::Internal::Type::BaseModel
        # @!attribute fields
        #
        #   @return [Hash{Symbol=>Vatsense::Models::BatchResult::Match::Field}, nil]
        optional :fields, -> { Vatsense::Internal::Type::HashOf[Vatsense::Models::BatchResult::Match::Field] }, nil?: true

        # @!attribute result
        #   `likely`, `possible`, `unlikely` or `not_applicable`.
        #
        #   @return [String, nil]
        optional :result, String, nil?: true

        # @!attribute score
        #
        #   @return [Integer, nil]
        optional :score, Integer, nil?: true

        # @see Vatsense::Models::BatchResult::Match#fields
        class Field < Vatsense::Internal::Type::BaseModel
          # @!attribute result
          #
          #   @return [String, nil]
          optional :result, String, nil?: true

          # @!attribute score
          #
          #   @return [Integer, nil]
          optional :score, Integer, nil?: true

          # @!attribute sent
          #   The detail as it was sent.
          #
          #   @return [String, nil]
          optional :sent, String, nil?: true

          # @!attribute vies
          #
          #   @return [String, nil]
          optional :vies, String, nil?: true
        end
      end
    end
  end
end

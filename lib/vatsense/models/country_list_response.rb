# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Countries#list
    class CountryListResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<Vatsense::Models::Country>, nil]
      optional :data, -> { Vatsense::Internal::Type::ArrayOf[Vatsense::Country] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<Vatsense::Models::Country>]
      #   @param success [Boolean]
    end
  end
end

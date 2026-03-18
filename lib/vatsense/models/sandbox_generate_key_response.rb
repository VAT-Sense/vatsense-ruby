# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Sandbox#generate_key
    class SandboxGenerateKeyResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::SandboxGenerateKeyResponse::Data, nil]
      optional :data, -> { Vatsense::Models::SandboxGenerateKeyResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::SandboxGenerateKeyResponse::Data]
      #   @param success [Boolean]

      # @see Vatsense::Models::SandboxGenerateKeyResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute allowed_endpoints
        #
        #   @return [Array<String>, nil]
        optional :allowed_endpoints, Vatsense::Internal::Type::ArrayOf[String]

        # @!attribute expires_at
        #
        #   @return [Time, nil]
        optional :expires_at, Time

        # @!attribute key
        #   The temporary sandbox API key.
        #
        #   @return [String, nil]
        optional :key, String

        # @!attribute requests_remaining
        #
        #   @return [Integer, nil]
        optional :requests_remaining, Integer

        # @!attribute signup_url
        #
        #   @return [String, nil]
        optional :signup_url, String

        # @!method initialize(allowed_endpoints: nil, expires_at: nil, key: nil, requests_remaining: nil, signup_url: nil)
        #   @param allowed_endpoints [Array<String>]
        #
        #   @param expires_at [Time]
        #
        #   @param key [String] The temporary sandbox API key.
        #
        #   @param requests_remaining [Integer]
        #
        #   @param signup_url [String]
      end
    end
  end
end

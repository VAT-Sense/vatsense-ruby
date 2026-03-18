# frozen_string_literal: true

module Vatsense
  module Resources
    # Temporary sandbox API keys for testing
    class Sandbox
      # Generate a temporary sandbox API key for testing. Sandbox keys have limited
      # request allowances and restricted endpoint access (no invoice endpoints). Rate
      # limited to 1 key per IP address per 6 hours.
      #
      # @overload generate_key(request_options: {})
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::SandboxGenerateKeyResponse]
      #
      # @see Vatsense::Models::SandboxGenerateKeyParams
      def generate_key(params = {})
        @client.request(
          method: :post,
          path: "sandbox/key",
          model: Vatsense::Models::SandboxGenerateKeyResponse,
          security: {},
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Vatsense::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end

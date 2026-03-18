# frozen_string_literal: true

module VatSense
  module Resources
    # Temporary sandbox API keys for testing
    class Sandbox
      # Generate a temporary sandbox API key for testing. Sandbox keys have limited
      # request allowances and restricted endpoint access (no invoice endpoints). Rate
      # limited to 1 key per IP address per 6 hours.
      #
      # @overload generate_key(request_options: {})
      #
      # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [VatSense::Models::SandboxGenerateKeyResponse]
      #
      # @see VatSense::Models::SandboxGenerateKeyParams
      def generate_key(params = {})
        @client.request(
          method: :post,
          path: "sandbox/key",
          model: VatSense::Models::SandboxGenerateKeyResponse,
          security: {},
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [VatSense::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end

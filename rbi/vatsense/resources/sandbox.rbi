# typed: strong

module Vatsense
  module Resources
    # Temporary sandbox API keys for testing
    class Sandbox
      # Generate a temporary sandbox API key for testing. Sandbox keys have limited
      # request allowances and restricted endpoint access (no invoice endpoints). Rate
      # limited to 1 key per IP address per 6 hours.
      sig do
        params(request_options: Vatsense::RequestOptions::OrHash).returns(
          Vatsense::Models::SandboxGenerateKeyResponse
        )
      end
      def generate_key(request_options: {})
      end

      # @api private
      sig { params(client: Vatsense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

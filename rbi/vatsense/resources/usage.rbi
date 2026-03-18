# typed: strong

module Vatsense
  module Resources
    # API usage statistics
    class Usage
      # Check your used and remaining API requests.
      sig do
        params(request_options: Vatsense::RequestOptions::OrHash).returns(
          Vatsense::Models::UsageRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: Vatsense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

# typed: strong

module VatSense
  module Resources
    # API usage statistics
    class Usage
      # Check your used and remaining API requests.
      sig do
        params(request_options: VatSense::RequestOptions::OrHash).returns(
          VatSense::Models::UsageRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: VatSense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

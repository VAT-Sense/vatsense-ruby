# frozen_string_literal: true

module VatSense
  module Resources
    # API usage statistics
    class Usage
      # Check your used and remaining API requests.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [VatSense::Models::UsageRetrieveResponse]
      #
      # @see VatSense::Models::UsageRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "usage",
          model: VatSense::Models::UsageRetrieveResponse,
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

# frozen_string_literal: true

module Vatsense
  module Resources
    # API usage statistics
    class Usage
      # Check your used and remaining API requests.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::UsageRetrieveResponse]
      #
      # @see Vatsense::Models::UsageRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "usage",
          model: Vatsense::Models::UsageRetrieveResponse,
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

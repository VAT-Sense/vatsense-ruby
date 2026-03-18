# frozen_string_literal: true

module Vatsense
  module Resources
    # VAT and EORI number validation
    class Validate
      # Some parameter documentations has been truncated, see
      # {Vatsense::Models::ValidateCheckParams} for more details.
      #
      # Check whether a given VAT number or EORI number is valid against live government
      # records.
      #
      # **VAT validation** checks against UK (HMRC), EU (VIES), Australia, Norway,
      # Switzerland, South Africa, and Brazil records.
      #
      # **EORI validation** checks against UK and EU records only.
      #
      # If the external validation service is temporarily unavailable, the API returns a
      # `412` error and the request does not count against your usage quota.
      #
      # Provide either `vat_number` or `eori_number`, but not both.
      #
      # @overload check(eori_number: nil, requester_vat_number: nil, vat_number: nil, request_options: {})
      #
      # @param eori_number [String] The EORI number to validate. Must include the leading 2-character
      #
      # @param requester_vat_number [String] Your own VAT number. If supplied, the response will include a unique
      #
      # @param vat_number [String] The VAT number to validate. Must include the leading 2-character
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::ValidateCheckResponse]
      #
      # @see Vatsense::Models::ValidateCheckParams
      def check(params = {})
        parsed, options = Vatsense::ValidateCheckParams.dump_request(params)
        query = Vatsense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "validate",
          query: query,
          model: Vatsense::Models::ValidateCheckResponse,
          options: options
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

# typed: strong

module Vatsense
  module Resources
    # VAT and EORI number validation
    class Validate
      # Check whether a given VAT number or EORI number is valid against live government
      # records.
      #
      # **VAT validation** checks against UK (HMRC), EU (VIES), Australia, Norway,
      # Switzerland, South Africa, and Brazil records.
      #
      # **EORI validation** checks against UK and EU records only.
      #
      # If the external validation service is temporarily unavailable, the API returns a
      # `412` error and the request does not count against your usage quota. It also
      # returns the `412`, uncounted, when a check takes longer than 55 seconds for a
      # number checked with VIES or the EU EORI service, or 25 seconds for any other.
      # With a webhook endpoint taking `validation.completed`, a number that got the
      # `412` keeps being checked and the answer is sent by webhook
      # (https://vatsense.com/documentation#webhooks).
      #
      # Provide either `vat_number` or `eori_number`, but not both.
      sig do
        params(
          eori_number: String,
          match_address: String,
          match_city: String,
          match_company_name: String,
          match_postcode: String,
          match_street: String,
          requester_vat_number: String,
          vat_number: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::ValidateCheckResponse)
      end
      def check(
        # The EORI number to validate. Must include the leading 2-character country code
        # (e.g. "GB123456789123"). UK and EU only.
        eori_number: nil,
        match_address: nil,
        match_city: nil,
        match_company_name: nil,
        match_postcode: nil,
        match_street: nil,
        # Your own VAT number. If supplied, the response will include a unique
        # consultation number issued by the relevant authority (VIES or HMRC). Must
        # include the leading 2-character country code.
        #
        # Note: GB requester numbers only work for GB validations; EU requester numbers
        # only work for EU validations. Cross-region is not supported.
        requester_vat_number: nil,
        # The VAT number to validate. Must include the leading 2-character country code
        # (e.g. "GB288305674", "FR12345678901").
        vat_number: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Vatsense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

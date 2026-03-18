# typed: strong

module VatSense
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
      # `412` error and the request does not count against your usage quota.
      #
      # Provide either `vat_number` or `eori_number`, but not both.
      sig do
        params(
          eori_number: String,
          requester_vat_number: String,
          vat_number: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(VatSense::Models::ValidateCheckResponse)
      end
      def check(
        # The EORI number to validate. Must include the leading 2-character country code
        # (e.g. "GB123456789123"). UK and EU only.
        eori_number: nil,
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
      sig { params(client: VatSense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

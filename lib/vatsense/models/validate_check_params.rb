# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Validate#check
    class ValidateCheckParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!attribute eori_number
      #   The EORI number to validate. Must include the leading 2-character country code
      #   (e.g. "GB123456789123"). UK and EU only.
      #
      #   @return [String, nil]
      optional :eori_number, String

      # @!attribute match_address
      #   The whole address you hold, as one line, matched against the registered
      #   address.
      #
      #   @return [String, nil]
      optional :match_address, String

      # @!attribute match_city
      #   The town or city you hold, looked for in the registered address.
      #
      #   @return [String, nil]
      optional :match_city, String

      # @!attribute match_company_name
      #   The company name you hold, matched against the registered name. Legal forms
      #   such as Ltd or GmbH, accents, punctuation and word order are ignored. Sending
      #   any `match_` parameter adds `match` to the response; matching costs nothing
      #   extra.
      #
      #   @return [String, nil]
      optional :match_company_name, String

      # @!attribute match_postcode
      #   The postcode you hold, looked for in the registered address. Spaces are
      #   ignored.
      #
      #   @return [String, nil]
      optional :match_postcode, String

      # @!attribute consultation_optional
      #   Send `true` with `requester_vat_number` if you would rather have an answer than
      #   wait for a consultation number. When VIES cannot answer for the number's
      #   country and that country has a national register fallback, the answer comes
      #   from the register with no `consultation_number`, instead of the `412`. If VIES
      #   cannot check your own `requester_vat_number`, the number is checked without it,
      #   again with no `consultation_number`. Leave it out if you need the consultation
      #   number as proof of the check.
      #
      #   @return [Boolean, nil]
      optional :consultation_optional, Vatsense::Internal::Type::Boolean

      # @!attribute match_street
      #   The street line you hold, looked for in the registered address.
      #
      #   @return [String, nil]
      optional :match_street, String

      # @!attribute requester_vat_number
      #   Your own VAT number. If supplied, the response will include a unique
      #   consultation number issued by the relevant authority (VIES or HMRC). Must
      #   include the leading 2-character country code.
      #
      #   Note: GB requester numbers only work for GB validations; EU requester numbers
      #   only work for EU validations. Cross-region is not supported.
      #
      #   @return [String, nil]
      optional :requester_vat_number, String

      # @!attribute vat_number
      #   The VAT number to validate. Must include the leading 2-character country code
      #   (e.g. "GB288305674", "FR12345678901").
      #
      #   @return [String, nil]
      optional :vat_number, String

      # @!method initialize(eori_number: nil, requester_vat_number: nil, vat_number: nil, match_address: nil, match_city: nil, match_company_name: nil, match_postcode: nil, match_street: nil, consultation_optional: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::ValidateCheckParams} for more details.
      #
      #   @param eori_number [String] The EORI number to validate. Must include the leading 2-character
      #
      #   @param requester_vat_number [String] Your own VAT number. If supplied, the response will include a unique
      #
      #   @param vat_number [String] The VAT number to validate. Must include the leading 2-character
      #
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

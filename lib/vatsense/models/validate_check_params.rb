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

      # @!method initialize(eori_number: nil, requester_vat_number: nil, vat_number: nil, request_options: {})
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

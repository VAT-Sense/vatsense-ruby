# typed: strong

module VatSense
  module Models
    class ValidateCheckParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(VatSense::ValidateCheckParams, VatSense::Internal::AnyHash)
        end

      # The EORI number to validate. Must include the leading 2-character country code
      # (e.g. "GB123456789123"). UK and EU only.
      sig { returns(T.nilable(String)) }
      attr_reader :eori_number

      sig { params(eori_number: String).void }
      attr_writer :eori_number

      # Your own VAT number. If supplied, the response will include a unique
      # consultation number issued by the relevant authority (VIES or HMRC). Must
      # include the leading 2-character country code.
      #
      # Note: GB requester numbers only work for GB validations; EU requester numbers
      # only work for EU validations. Cross-region is not supported.
      sig { returns(T.nilable(String)) }
      attr_reader :requester_vat_number

      sig { params(requester_vat_number: String).void }
      attr_writer :requester_vat_number

      # The VAT number to validate. Must include the leading 2-character country code
      # (e.g. "GB288305674", "FR12345678901").
      sig { returns(T.nilable(String)) }
      attr_reader :vat_number

      sig { params(vat_number: String).void }
      attr_writer :vat_number

      sig do
        params(
          eori_number: String,
          requester_vat_number: String,
          vat_number: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            eori_number: String,
            requester_vat_number: String,
            vat_number: String,
            request_options: VatSense::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

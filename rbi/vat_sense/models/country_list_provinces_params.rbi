# typed: strong

module VatSense
  module Models
    class CountryListProvincesParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            VatSense::CountryListProvincesParams,
            VatSense::Internal::AnyHash
          )
        end

      # A 2-character ISO 3166-1 alpha-2 country code (e.g. "CA").
      sig { returns(String) }
      attr_accessor :country_code

      sig do
        params(
          country_code: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "CA").
        country_code:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { country_code: String, request_options: VatSense::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

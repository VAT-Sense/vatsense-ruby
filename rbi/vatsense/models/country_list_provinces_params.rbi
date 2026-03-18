# typed: strong

module Vatsense
  module Models
    class CountryListProvincesParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Vatsense::CountryListProvincesParams,
            Vatsense::Internal::AnyHash
          )
        end

      # A 2-character ISO 3166-1 alpha-2 country code (e.g. "CA").
      sig { returns(String) }
      attr_accessor :country_code

      sig do
        params(
          country_code: String,
          request_options: Vatsense::RequestOptions::OrHash
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
          { country_code: String, request_options: Vatsense::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module Vatsense
  module Models
    class CountryListParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Vatsense::CountryListParams, Vatsense::Internal::AnyHash)
        end

      # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      # address.
      sig { returns(T.nilable(String)) }
      attr_reader :ip_address

      sig { params(ip_address: String).void }
      attr_writer :ip_address

      sig do
        params(
          country_code: String,
          ip_address: String,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
        country_code: nil,
        # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
        # address.
        ip_address: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            ip_address: String,
            request_options: Vatsense::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

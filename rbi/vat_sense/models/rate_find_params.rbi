# typed: strong

module VatSense
  module Models
    class RateFindParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(VatSense::RateFindParams, VatSense::Internal::AnyHash)
        end

      # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :eu

      sig { params(eu: T::Boolean).void }
      attr_writer :eu

      # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
      # address.
      sig { returns(T.nilable(String)) }
      attr_reader :ip_address

      sig { params(ip_address: String).void }
      attr_writer :ip_address

      # A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
      # a past date.
      sig { returns(T.nilable(Time)) }
      attr_reader :period

      sig { params(period: Time).void }
      attr_writer :period

      # A 2-character province code (e.g. "NU", "NT"). If providing a province code, you
      # must also provide the relevant country_code.
      sig { returns(T.nilable(String)) }
      attr_reader :province_code

      sig { params(province_code: String).void }
      attr_writer :province_code

      # The product type to find the applicable rate for. See the /rates/types endpoint
      # for a full list of valid values.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig do
        params(
          country_code: String,
          eu: T::Boolean,
          ip_address: String,
          period: Time,
          province_code: String,
          type: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A 2-character ISO 3166-1 alpha-2 country code (e.g. "GB", "FR").
        country_code: nil,
        # Filter results by EU membership. Use 1 for EU countries only, 0 for non-EU only.
        eu: nil,
        # An IPv4 or IPv6 address. If provided, the country will be determined from the IP
        # address.
        ip_address: nil,
        # A historical date to retrieve rates for (format "YYYY-MM-DD HH:MM:SS"). Must be
        # a past date.
        period: nil,
        # A 2-character province code (e.g. "NU", "NT"). If providing a province code, you
        # must also provide the relevant country_code.
        province_code: nil,
        # The product type to find the applicable rate for. See the /rates/types endpoint
        # for a full list of valid values.
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            eu: T::Boolean,
            ip_address: String,
            period: Time,
            province_code: String,
            type: String,
            request_options: VatSense::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

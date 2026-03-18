# typed: strong

module Vatsense
  module Models
    class InvoiceCustomerInput < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Vatsense::InvoiceCustomerInput, Vatsense::Internal::AnyHash)
        end

      # The customer's trading name.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_reader :address

      sig { params(address: String).void }
      attr_writer :address

      sig { returns(T.nilable(String)) }
      attr_reader :company_number

      sig { params(company_number: String).void }
      attr_writer :company_number

      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # URL to the customer logo (HTTPS only, .jpg/.png).
      sig { returns(T.nilable(String)) }
      attr_reader :logo

      sig { params(logo: String).void }
      attr_writer :logo

      sig { returns(T.nilable(String)) }
      attr_reader :vat_number

      sig { params(vat_number: String).void }
      attr_writer :vat_number

      sig do
        params(
          name: String,
          address: String,
          company_number: String,
          country_code: String,
          email: String,
          logo: String,
          vat_number: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The customer's trading name.
        name:,
        address: nil,
        company_number: nil,
        country_code: nil,
        email: nil,
        # URL to the customer logo (HTTPS only, .jpg/.png).
        logo: nil,
        vat_number: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            address: String,
            company_number: String,
            country_code: String,
            email: String,
            logo: String,
            vat_number: String
          }
        )
      end
      def to_hash
      end
    end
  end
end

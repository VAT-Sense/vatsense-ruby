# frozen_string_literal: true

module Vatsense
  module Models
    class InvoiceCustomerInput < Vatsense::Internal::Type::BaseModel
      # @!attribute name
      #   The customer's trading name.
      #
      #   @return [String]
      required :name, String

      # @!attribute address
      #
      #   @return [String, nil]
      optional :address, String

      # @!attribute company_number
      #
      #   @return [String, nil]
      optional :company_number, String

      # @!attribute country_code
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute logo
      #   URL to the customer logo (HTTPS only, .jpg/.png).
      #
      #   @return [String, nil]
      optional :logo, String

      # @!attribute vat_number
      #
      #   @return [String, nil]
      optional :vat_number, String

      # @!method initialize(name:, address: nil, company_number: nil, country_code: nil, email: nil, logo: nil, vat_number: nil)
      #   @param name [String] The customer's trading name.
      #
      #   @param address [String]
      #
      #   @param company_number [String]
      #
      #   @param country_code [String]
      #
      #   @param email [String]
      #
      #   @param logo [String] URL to the customer logo (HTTPS only, .jpg/.png).
      #
      #   @param vat_number [String]
    end
  end
end

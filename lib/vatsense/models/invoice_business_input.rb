# frozen_string_literal: true

module Vatsense
  module Models
    class InvoiceBusinessInput < Vatsense::Internal::Type::BaseModel
      # @!attribute address
      #   Your business trading address.
      #
      #   @return [String]
      required :address, String

      # @!attribute name
      #   Your business trading name.
      #
      #   @return [String]
      required :name, String

      # @!attribute vat_number
      #   Your business VAT number.
      #
      #   @return [String]
      required :vat_number, String

      # @!attribute bank_account
      #
      #   @return [String, nil]
      optional :bank_account, String

      # @!attribute company_number
      #   Your business company number.
      #
      #   @return [String, nil]
      optional :company_number, String

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute logo
      #   URL to your company logo (HTTPS only, .svg/.jpg/.png). Recommended 240px by
      #   60px.
      #
      #   @return [String, nil]
      optional :logo, String

      # @!attribute phone
      #
      #   @return [String, nil]
      optional :phone, String

      # @!attribute website
      #
      #   @return [String, nil]
      optional :website, String

      # @!method initialize(address:, name:, vat_number:, bank_account: nil, company_number: nil, email: nil, logo: nil, phone: nil, website: nil)
      #   Some parameter documentations has been truncated, see
      #   {Vatsense::Models::InvoiceBusinessInput} for more details.
      #
      #   @param address [String] Your business trading address.
      #
      #   @param name [String] Your business trading name.
      #
      #   @param vat_number [String] Your business VAT number.
      #
      #   @param bank_account [String]
      #
      #   @param company_number [String] Your business company number.
      #
      #   @param email [String]
      #
      #   @param logo [String] URL to your company logo (HTTPS only, .svg/.jpg/.png). Recommended 240px by 60px
      #
      #   @param phone [String]
      #
      #   @param website [String]
    end
  end
end

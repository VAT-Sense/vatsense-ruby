# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Validate#check
    class ValidateCheckResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Vatsense::Models::ValidateCheckResponse::Data, nil]
      optional :data, -> { Vatsense::Models::ValidateCheckResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Vatsense::Models::ValidateCheckResponse::Data]
      #   @param success [Boolean]

      # @see Vatsense::Models::ValidateCheckResponse#data
      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute company
        #
        #   @return [Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany, Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany, nil]
        optional :company, union: -> { Vatsense::Models::ValidateCheckResponse::Data::Company }

        # @!attribute consultation_number
        #   Official consultation number (only returned when requester_vat_number is
        #   provided).
        #
        #   @return [String, nil]
        optional :consultation_number, String, nil?: true

        # @!attribute valid
        #   Whether the VAT/EORI number is valid.
        #
        #   @return [Boolean, nil]
        optional :valid, Vatsense::Internal::Type::Boolean

        # @!method initialize(company: nil, consultation_number: nil, valid: nil)
        #   Some parameter documentations has been truncated, see
        #   {Vatsense::Models::ValidateCheckResponse::Data} for more details.
        #
        #   @param company [Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany, Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany]
        #
        #   @param consultation_number [String, nil] Official consultation number (only returned when requester_vat_number is provide
        #
        #   @param valid [Boolean] Whether the VAT/EORI number is valid.

        # @see Vatsense::Models::ValidateCheckResponse::Data#company
        module Company
          extend Vatsense::Internal::Type::Union

          variant -> { Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany }

          variant -> { Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany }

          class ValidationCompany < Vatsense::Internal::Type::BaseModel
            # @!attribute company_address
            #
            #   @return [String, nil]
            optional :company_address, String

            # @!attribute company_name
            #
            #   @return [String, nil]
            optional :company_name, String

            # @!attribute country_code
            #
            #   @return [String, nil]
            optional :country_code, String

            # @!attribute vat_number
            #   The VAT number (without country code prefix).
            #
            #   @return [String, nil]
            optional :vat_number, String

            # @!method initialize(company_address: nil, company_name: nil, country_code: nil, vat_number: nil)
            #   @param company_address [String]
            #
            #   @param company_name [String]
            #
            #   @param country_code [String]
            #
            #   @param vat_number [String] The VAT number (without country code prefix).
          end

          class EoriValidationCompany < Vatsense::Internal::Type::BaseModel
            # @!attribute company_address
            #
            #   @return [String, nil]
            optional :company_address, String

            # @!attribute company_name
            #
            #   @return [String, nil]
            optional :company_name, String

            # @!attribute country_code
            #
            #   @return [String, nil]
            optional :country_code, String

            # @!attribute eori_number
            #   The EORI number (without country code prefix).
            #
            #   @return [String, nil]
            optional :eori_number, String

            # @!method initialize(company_address: nil, company_name: nil, country_code: nil, eori_number: nil)
            #   @param company_address [String]
            #
            #   @param company_name [String]
            #
            #   @param country_code [String]
            #
            #   @param eori_number [String] The EORI number (without country code prefix).
          end

          # @!method self.variants
          #   @return [Array(Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany, Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany)]
        end
      end
    end
  end
end

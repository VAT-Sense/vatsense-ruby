# typed: strong

module Vatsense
  module Models
    class ValidateCheckResponse < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Vatsense::Models::ValidateCheckResponse,
            Vatsense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig { returns(T.nilable(Vatsense::Models::ValidateCheckResponse::Data)) }
      attr_reader :data

      sig do
        params(data: Vatsense::Models::ValidateCheckResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          code: Integer,
          data: Vatsense::Models::ValidateCheckResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data: Vatsense::Models::ValidateCheckResponse::Data,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Vatsense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Vatsense::Models::ValidateCheckResponse::Data,
              Vatsense::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Vatsense::Models::ValidateCheckResponse::Data::Company::Variants
            )
          )
        end
        attr_reader :company

        sig do
          params(
            company:
              T.any(
                Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany::OrHash,
                Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany::OrHash
              )
          ).void
        end
        attr_writer :company

        # Official consultation number (only returned when requester_vat_number is
        # provided).
        sig { returns(T.nilable(String)) }
        attr_accessor :consultation_number

        # Whether the VAT/EORI number is valid.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :valid

        sig { params(valid: T::Boolean).void }
        attr_writer :valid

        sig do
          params(
            company:
              T.any(
                Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany::OrHash,
                Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany::OrHash
              ),
            consultation_number: T.nilable(String),
            valid: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          company: nil,
          # Official consultation number (only returned when requester_vat_number is
          # provided).
          consultation_number: nil,
          # Whether the VAT/EORI number is valid.
          valid: nil
        )
        end

        sig do
          override.returns(
            {
              company:
                Vatsense::Models::ValidateCheckResponse::Data::Company::Variants,
              consultation_number: T.nilable(String),
              valid: T::Boolean
            }
          )
        end
        def to_hash
        end

        module Company
          extend Vatsense::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany,
                Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany
              )
            end

          class ValidationCompany < Vatsense::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Vatsense::Models::ValidateCheckResponse::Data::Company::ValidationCompany,
                  Vatsense::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :company_address

            sig { params(company_address: String).void }
            attr_writer :company_address

            sig { returns(T.nilable(String)) }
            attr_reader :company_name

            sig { params(company_name: String).void }
            attr_writer :company_name

            sig { returns(T.nilable(String)) }
            attr_reader :country_code

            sig { params(country_code: String).void }
            attr_writer :country_code

            # The VAT number (without country code prefix).
            sig { returns(T.nilable(String)) }
            attr_reader :vat_number

            sig { params(vat_number: String).void }
            attr_writer :vat_number

            sig do
              params(
                company_address: String,
                company_name: String,
                country_code: String,
                vat_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              company_address: nil,
              company_name: nil,
              country_code: nil,
              # The VAT number (without country code prefix).
              vat_number: nil
            )
            end

            sig do
              override.returns(
                {
                  company_address: String,
                  company_name: String,
                  country_code: String,
                  vat_number: String
                }
              )
            end
            def to_hash
            end
          end

          class EoriValidationCompany < Vatsense::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Vatsense::Models::ValidateCheckResponse::Data::Company::EoriValidationCompany,
                  Vatsense::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :company_address

            sig { params(company_address: String).void }
            attr_writer :company_address

            sig { returns(T.nilable(String)) }
            attr_reader :company_name

            sig { params(company_name: String).void }
            attr_writer :company_name

            sig { returns(T.nilable(String)) }
            attr_reader :country_code

            sig { params(country_code: String).void }
            attr_writer :country_code

            # The EORI number (without country code prefix).
            sig { returns(T.nilable(String)) }
            attr_reader :eori_number

            sig { params(eori_number: String).void }
            attr_writer :eori_number

            sig do
              params(
                company_address: String,
                company_name: String,
                country_code: String,
                eori_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              company_address: nil,
              company_name: nil,
              country_code: nil,
              # The EORI number (without country code prefix).
              eori_number: nil
            )
            end

            sig do
              override.returns(
                {
                  company_address: String,
                  company_name: String,
                  country_code: String,
                  eori_number: String
                }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                Vatsense::Models::ValidateCheckResponse::Data::Company::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end

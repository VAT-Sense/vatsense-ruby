# typed: strong

module VatSense
  module Models
    class CountryListProvincesResponse < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            VatSense::Models::CountryListProvincesResponse,
            VatSense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig do
        returns(
          T.nilable(
            T::Array[VatSense::Models::CountryListProvincesResponse::Data]
          )
        )
      end
      attr_reader :data

      sig do
        params(
          data:
            T::Array[
              VatSense::Models::CountryListProvincesResponse::Data::OrHash
            ]
        ).void
      end
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          code: Integer,
          data:
            T::Array[
              VatSense::Models::CountryListProvincesResponse::Data::OrHash
            ],
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data:
              T::Array[VatSense::Models::CountryListProvincesResponse::Data],
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              VatSense::Models::CountryListProvincesResponse::Data,
              VatSense::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :country_code

        sig { params(country_code: String).void }
        attr_writer :country_code

        sig do
          returns(
            T.nilable(
              VatSense::Models::CountryListProvincesResponse::Data::Object::TaggedSymbol
            )
          )
        end
        attr_reader :object

        sig do
          params(
            object:
              VatSense::Models::CountryListProvincesResponse::Data::Object::OrSymbol
          ).void
        end
        attr_writer :object

        sig { returns(T.nilable(String)) }
        attr_reader :province_code

        sig { params(province_code: String).void }
        attr_writer :province_code

        sig { returns(T.nilable(String)) }
        attr_reader :province_name

        sig { params(province_name: String).void }
        attr_writer :province_name

        sig do
          params(
            country_code: String,
            object:
              VatSense::Models::CountryListProvincesResponse::Data::Object::OrSymbol,
            province_code: String,
            province_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          country_code: nil,
          object: nil,
          province_code: nil,
          province_name: nil
        )
        end

        sig do
          override.returns(
            {
              country_code: String,
              object:
                VatSense::Models::CountryListProvincesResponse::Data::Object::TaggedSymbol,
              province_code: String,
              province_name: String
            }
          )
        end
        def to_hash
        end

        module Object
          extend VatSense::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                VatSense::Models::CountryListProvincesResponse::Data::Object
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PROVINCE =
            T.let(
              :province,
              VatSense::Models::CountryListProvincesResponse::Data::Object::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                VatSense::Models::CountryListProvincesResponse::Data::Object::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

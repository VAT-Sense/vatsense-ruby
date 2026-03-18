# typed: strong

module Vatsense
  module Models
    class RateCalculatePriceResponse < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Vatsense::Models::RateCalculatePriceResponse,
            Vatsense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig do
        returns(T.nilable(Vatsense::Models::RateCalculatePriceResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data: Vatsense::Models::RateCalculatePriceResponse::Data::OrHash
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
          data: Vatsense::Models::RateCalculatePriceResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data: Vatsense::Models::RateCalculatePriceResponse::Data,
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
              Vatsense::Models::RateCalculatePriceResponse::Data,
              Vatsense::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :country_code

        sig { params(country_code: String).void }
        attr_writer :country_code

        sig { returns(T.nilable(String)) }
        attr_reader :country_name

        sig { params(country_name: String).void }
        attr_writer :country_name

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :eu

        sig { params(eu: T::Boolean).void }
        attr_writer :eu

        sig do
          returns(
            T.nilable(
              Vatsense::Models::RateCalculatePriceResponse::Data::Object::TaggedSymbol
            )
          )
        end
        attr_reader :object

        sig do
          params(
            object:
              Vatsense::Models::RateCalculatePriceResponse::Data::Object::OrSymbol
          ).void
        end
        attr_writer :object

        sig { returns(T.nilable(Vatsense::TaxRate)) }
        attr_reader :tax_rate

        sig { params(tax_rate: Vatsense::TaxRate::OrHash).void }
        attr_writer :tax_rate

        sig { returns(T.nilable(Vatsense::VatPrice)) }
        attr_reader :vat_price

        sig { params(vat_price: Vatsense::VatPrice::OrHash).void }
        attr_writer :vat_price

        sig do
          params(
            country_code: String,
            country_name: String,
            eu: T::Boolean,
            object:
              Vatsense::Models::RateCalculatePriceResponse::Data::Object::OrSymbol,
            tax_rate: Vatsense::TaxRate::OrHash,
            vat_price: Vatsense::VatPrice::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          country_code: nil,
          country_name: nil,
          eu: nil,
          object: nil,
          tax_rate: nil,
          vat_price: nil
        )
        end

        sig do
          override.returns(
            {
              country_code: String,
              country_name: String,
              eu: T::Boolean,
              object:
                Vatsense::Models::RateCalculatePriceResponse::Data::Object::TaggedSymbol,
              tax_rate: Vatsense::TaxRate,
              vat_price: Vatsense::VatPrice
            }
          )
        end
        def to_hash
        end

        module Object
          extend Vatsense::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Vatsense::Models::RateCalculatePriceResponse::Data::Object
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RATE =
            T.let(
              :rate,
              Vatsense::Models::RateCalculatePriceResponse::Data::Object::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Vatsense::Models::RateCalculatePriceResponse::Data::Object::TaggedSymbol
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

# typed: strong

module Vatsense
  module Models
    class RateWithTaxRate < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Vatsense::RateWithTaxRate, Vatsense::Internal::AnyHash)
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
        returns(T.nilable(Vatsense::RateWithTaxRate::Object::TaggedSymbol))
      end
      attr_reader :object

      sig { params(object: Vatsense::RateWithTaxRate::Object::OrSymbol).void }
      attr_writer :object

      sig { returns(T.nilable(Vatsense::TaxRate)) }
      attr_reader :tax_rate

      sig { params(tax_rate: Vatsense::TaxRate::OrHash).void }
      attr_writer :tax_rate

      sig do
        params(
          country_code: String,
          country_name: String,
          eu: T::Boolean,
          object: Vatsense::RateWithTaxRate::Object::OrSymbol,
          tax_rate: Vatsense::TaxRate::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        country_code: nil,
        country_name: nil,
        eu: nil,
        object: nil,
        tax_rate: nil
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            country_name: String,
            eu: T::Boolean,
            object: Vatsense::RateWithTaxRate::Object::TaggedSymbol,
            tax_rate: Vatsense::TaxRate
          }
        )
      end
      def to_hash
      end

      module Object
        extend Vatsense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Vatsense::RateWithTaxRate::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RATE = T.let(:rate, Vatsense::RateWithTaxRate::Object::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Vatsense::RateWithTaxRate::Object::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

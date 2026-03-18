# typed: strong

module Vatsense
  module Models
    class TaxRate < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Vatsense::TaxRate, Vatsense::Internal::AnyHash) }

      # The rate class (e.g. "standard", "reduced", "zero").
      sig { returns(T.nilable(String)) }
      attr_reader :class_

      sig { params(class_: String).void }
      attr_writer :class_

      # A description of what goods/services this rate applies to.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(Vatsense::TaxRate::Object::TaggedSymbol)) }
      attr_reader :object

      sig { params(object: Vatsense::TaxRate::Object::OrSymbol).void }
      attr_writer :object

      # The tax rate percentage.
      sig { returns(T.nilable(Float)) }
      attr_reader :rate

      sig { params(rate: Float).void }
      attr_writer :rate

      # Comma-separated list of product types this rate applies to, or false if it
      # applies generally.
      sig { returns(T.nilable(Vatsense::TaxRate::Types::Variants)) }
      attr_reader :types

      sig { params(types: Vatsense::TaxRate::Types::Variants).void }
      attr_writer :types

      sig do
        params(
          class_: String,
          description: String,
          object: Vatsense::TaxRate::Object::OrSymbol,
          rate: Float,
          types: Vatsense::TaxRate::Types::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # The rate class (e.g. "standard", "reduced", "zero").
        class_: nil,
        # A description of what goods/services this rate applies to.
        description: nil,
        object: nil,
        # The tax rate percentage.
        rate: nil,
        # Comma-separated list of product types this rate applies to, or false if it
        # applies generally.
        types: nil
      )
      end

      sig do
        override.returns(
          {
            class_: String,
            description: String,
            object: Vatsense::TaxRate::Object::TaggedSymbol,
            rate: Float,
            types: Vatsense::TaxRate::Types::Variants
          }
        )
      end
      def to_hash
      end

      module Object
        extend Vatsense::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Vatsense::TaxRate::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TAX_RATE = T.let(:tax_rate, Vatsense::TaxRate::Object::TaggedSymbol)

        sig do
          override.returns(T::Array[Vatsense::TaxRate::Object::TaggedSymbol])
        end
        def self.values
        end
      end

      # Comma-separated list of product types this rate applies to, or false if it
      # applies generally.
      module Types
        extend Vatsense::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Boolean) }

        sig { override.returns(T::Array[Vatsense::TaxRate::Types::Variants]) }
        def self.variants
        end
      end
    end
  end
end

# typed: strong

module VatSense
  module Models
    class TaxRate < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(VatSense::TaxRate, VatSense::Internal::AnyHash) }

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

      sig { returns(T.nilable(VatSense::TaxRate::Object::TaggedSymbol)) }
      attr_reader :object

      sig { params(object: VatSense::TaxRate::Object::OrSymbol).void }
      attr_writer :object

      # The tax rate percentage.
      sig { returns(T.nilable(Float)) }
      attr_reader :rate

      sig { params(rate: Float).void }
      attr_writer :rate

      # Comma-separated list of product types this rate applies to, or false if it
      # applies generally.
      sig { returns(T.nilable(VatSense::TaxRate::Types::Variants)) }
      attr_reader :types

      sig { params(types: VatSense::TaxRate::Types::Variants).void }
      attr_writer :types

      sig do
        params(
          class_: String,
          description: String,
          object: VatSense::TaxRate::Object::OrSymbol,
          rate: Float,
          types: VatSense::TaxRate::Types::Variants
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
            object: VatSense::TaxRate::Object::TaggedSymbol,
            rate: Float,
            types: VatSense::TaxRate::Types::Variants
          }
        )
      end
      def to_hash
      end

      module Object
        extend VatSense::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, VatSense::TaxRate::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TAX_RATE = T.let(:tax_rate, VatSense::TaxRate::Object::TaggedSymbol)

        sig do
          override.returns(T::Array[VatSense::TaxRate::Object::TaggedSymbol])
        end
        def self.values
        end
      end

      # Comma-separated list of product types this rate applies to, or false if it
      # applies generally.
      module Types
        extend VatSense::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Boolean) }

        sig { override.returns(T::Array[VatSense::TaxRate::Types::Variants]) }
        def self.variants
        end
      end
    end
  end
end

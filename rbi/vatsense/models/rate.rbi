# typed: strong

module Vatsense
  module Models
    class Rate < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Vatsense::Rate, Vatsense::Internal::AnyHash) }

      # 2-character ISO 3166-1 alpha-2 country code.
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      sig { returns(T.nilable(String)) }
      attr_reader :country_name

      sig { params(country_name: String).void }
      attr_writer :country_name

      # Whether the country is an EU member.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :eu

      sig { params(eu: T::Boolean).void }
      attr_writer :eu

      sig { returns(T.nilable(Vatsense::Rate::Object::TaggedSymbol)) }
      attr_reader :object

      sig { params(object: Vatsense::Rate::Object::OrSymbol).void }
      attr_writer :object

      # A list of other tax rates. Null if no additional rates exist.
      sig { returns(T.nilable(T::Array[Vatsense::Rate::Other])) }
      attr_accessor :other

      sig { returns(T.nilable(Vatsense::TaxRate)) }
      attr_reader :standard

      sig { params(standard: Vatsense::TaxRate::OrHash).void }
      attr_writer :standard

      sig do
        params(
          country_code: String,
          country_name: String,
          eu: T::Boolean,
          object: Vatsense::Rate::Object::OrSymbol,
          other: T.nilable(T::Array[Vatsense::Rate::Other::OrHash]),
          standard: Vatsense::TaxRate::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # 2-character ISO 3166-1 alpha-2 country code.
        country_code: nil,
        country_name: nil,
        # Whether the country is an EU member.
        eu: nil,
        object: nil,
        # A list of other tax rates. Null if no additional rates exist.
        other: nil,
        standard: nil
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            country_name: String,
            eu: T::Boolean,
            object: Vatsense::Rate::Object::TaggedSymbol,
            other: T.nilable(T::Array[Vatsense::Rate::Other]),
            standard: Vatsense::TaxRate
          }
        )
      end
      def to_hash
      end

      module Object
        extend Vatsense::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Vatsense::Rate::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RATE = T.let(:rate, Vatsense::Rate::Object::TaggedSymbol)

        sig { override.returns(T::Array[Vatsense::Rate::Object::TaggedSymbol]) }
        def self.values
        end
      end

      class Other < Vatsense::Models::TaxRate
        OrHash =
          T.type_alias do
            T.any(Vatsense::Rate::Other, Vatsense::Internal::AnyHash)
          end

        # The province this rate applies to, if applicable.
        sig { returns(T.nilable(String)) }
        attr_accessor :province

        sig { params(province: T.nilable(String)).returns(T.attached_class) }
        def self.new(
          # The province this rate applies to, if applicable.
          province: nil
        )
        end

        sig { override.returns({ province: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end

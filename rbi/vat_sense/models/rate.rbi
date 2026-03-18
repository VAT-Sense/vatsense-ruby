# typed: strong

module VatSense
  module Models
    class Rate < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(VatSense::Rate, VatSense::Internal::AnyHash) }

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

      sig { returns(T.nilable(VatSense::Rate::Object::TaggedSymbol)) }
      attr_reader :object

      sig { params(object: VatSense::Rate::Object::OrSymbol).void }
      attr_writer :object

      # A list of other tax rates. Null if no additional rates exist.
      sig { returns(T.nilable(T::Array[VatSense::Rate::Other])) }
      attr_accessor :other

      sig { returns(T.nilable(VatSense::TaxRate)) }
      attr_reader :standard

      sig { params(standard: VatSense::TaxRate::OrHash).void }
      attr_writer :standard

      sig do
        params(
          country_code: String,
          country_name: String,
          eu: T::Boolean,
          object: VatSense::Rate::Object::OrSymbol,
          other: T.nilable(T::Array[VatSense::Rate::Other::OrHash]),
          standard: VatSense::TaxRate::OrHash
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
            object: VatSense::Rate::Object::TaggedSymbol,
            other: T.nilable(T::Array[VatSense::Rate::Other]),
            standard: VatSense::TaxRate
          }
        )
      end
      def to_hash
      end

      module Object
        extend VatSense::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, VatSense::Rate::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RATE = T.let(:rate, VatSense::Rate::Object::TaggedSymbol)

        sig { override.returns(T::Array[VatSense::Rate::Object::TaggedSymbol]) }
        def self.values
        end
      end

      class Other < VatSense::Models::TaxRate
        OrHash =
          T.type_alias do
            T.any(VatSense::Rate::Other, VatSense::Internal::AnyHash)
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

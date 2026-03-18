# typed: strong

module VatSense
  module Models
    class Country < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(VatSense::Country, VatSense::Internal::AnyHash) }

      # 2-character ISO 3166-1 alpha-2 country code.
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      sig { returns(T.nilable(String)) }
      attr_reader :country_name

      sig { params(country_name: String).void }
      attr_writer :country_name

      # Whether the country is subject to EU VAT.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :eu

      sig { params(eu: T::Boolean).void }
      attr_writer :eu

      sig { returns(T.nilable(Float)) }
      attr_reader :latitude

      sig { params(latitude: Float).void }
      attr_writer :latitude

      sig { returns(T.nilable(Float)) }
      attr_reader :longitude

      sig { params(longitude: Float).void }
      attr_writer :longitude

      sig { returns(T.nilable(VatSense::Country::Object::TaggedSymbol)) }
      attr_reader :object

      sig { params(object: VatSense::Country::Object::OrSymbol).void }
      attr_writer :object

      # Whether the country is subject to VAT/GST.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :vat

      sig { params(vat: T::Boolean).void }
      attr_writer :vat

      sig do
        params(
          country_code: String,
          country_name: String,
          eu: T::Boolean,
          latitude: Float,
          longitude: Float,
          object: VatSense::Country::Object::OrSymbol,
          vat: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # 2-character ISO 3166-1 alpha-2 country code.
        country_code: nil,
        country_name: nil,
        # Whether the country is subject to EU VAT.
        eu: nil,
        latitude: nil,
        longitude: nil,
        object: nil,
        # Whether the country is subject to VAT/GST.
        vat: nil
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            country_name: String,
            eu: T::Boolean,
            latitude: Float,
            longitude: Float,
            object: VatSense::Country::Object::TaggedSymbol,
            vat: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Object
        extend VatSense::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, VatSense::Country::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COUNTRY = T.let(:country, VatSense::Country::Object::TaggedSymbol)

        sig do
          override.returns(T::Array[VatSense::Country::Object::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end

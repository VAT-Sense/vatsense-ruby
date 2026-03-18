# typed: strong

module VatSense
  module Models
    class VatPrice < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(VatSense::VatPrice, VatSense::Internal::AnyHash) }

      sig { returns(T.nilable(VatSense::VatPrice::Object::TaggedSymbol)) }
      attr_reader :object

      sig { params(object: VatSense::VatPrice::Object::OrSymbol).void }
      attr_writer :object

      # The price provided.
      sig { returns(T.nilable(Float)) }
      attr_reader :price

      sig { params(price: Float).void }
      attr_writer :price

      # The calculated price exclusive of VAT.
      sig { returns(T.nilable(Float)) }
      attr_reader :price_excl_vat

      sig { params(price_excl_vat: Float).void }
      attr_writer :price_excl_vat

      # The calculated price inclusive of VAT.
      sig { returns(T.nilable(Float)) }
      attr_reader :price_incl_vat

      sig { params(price_incl_vat: Float).void }
      attr_writer :price_incl_vat

      # Whether the price is inclusive or exclusive of VAT.
      sig { returns(T.nilable(VatSense::VatPrice::TaxType::TaggedSymbol)) }
      attr_reader :tax_type

      sig { params(tax_type: VatSense::VatPrice::TaxType::OrSymbol).void }
      attr_writer :tax_type

      # The total VAT amount.
      sig { returns(T.nilable(Float)) }
      attr_reader :vat

      sig { params(vat: Float).void }
      attr_writer :vat

      # The VAT rate percentage.
      sig { returns(T.nilable(Float)) }
      attr_reader :vat_rate

      sig { params(vat_rate: Float).void }
      attr_writer :vat_rate

      sig do
        params(
          object: VatSense::VatPrice::Object::OrSymbol,
          price: Float,
          price_excl_vat: Float,
          price_incl_vat: Float,
          tax_type: VatSense::VatPrice::TaxType::OrSymbol,
          vat: Float,
          vat_rate: Float
        ).returns(T.attached_class)
      end
      def self.new(
        object: nil,
        # The price provided.
        price: nil,
        # The calculated price exclusive of VAT.
        price_excl_vat: nil,
        # The calculated price inclusive of VAT.
        price_incl_vat: nil,
        # Whether the price is inclusive or exclusive of VAT.
        tax_type: nil,
        # The total VAT amount.
        vat: nil,
        # The VAT rate percentage.
        vat_rate: nil
      )
      end

      sig do
        override.returns(
          {
            object: VatSense::VatPrice::Object::TaggedSymbol,
            price: Float,
            price_excl_vat: Float,
            price_incl_vat: Float,
            tax_type: VatSense::VatPrice::TaxType::TaggedSymbol,
            vat: Float,
            vat_rate: Float
          }
        )
      end
      def to_hash
      end

      module Object
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::VatPrice::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VAT_PRICE = T.let(:vat_price, VatSense::VatPrice::Object::TaggedSymbol)

        sig do
          override.returns(T::Array[VatSense::VatPrice::Object::TaggedSymbol])
        end
        def self.values
        end
      end

      # Whether the price is inclusive or exclusive of VAT.
      module TaxType
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::VatPrice::TaxType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCL = T.let(:incl, VatSense::VatPrice::TaxType::TaggedSymbol)
        EXCL = T.let(:excl, VatSense::VatPrice::TaxType::TaggedSymbol)

        sig do
          override.returns(T::Array[VatSense::VatPrice::TaxType::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end

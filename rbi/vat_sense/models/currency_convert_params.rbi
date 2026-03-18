# typed: strong

module VatSense
  module Models
    class CurrencyConvertParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(VatSense::CurrencyConvertParams, VatSense::Internal::AnyHash)
        end

      # The amount to convert. Must be a string with exactly 2 decimal places (e.g.
      # "39.99").
      sig { returns(String) }
      attr_accessor :amount

      # The 3-character source currency code (e.g. "USD", "CAD").
      sig { returns(String) }
      attr_accessor :from

      # The 3-character target currency code. Must be either "GBP" or "EUR".
      sig { returns(VatSense::CurrencyConvertParams::To::OrSymbol) }
      attr_accessor :to

      sig do
        params(
          amount: String,
          from: String,
          to: VatSense::CurrencyConvertParams::To::OrSymbol,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The amount to convert. Must be a string with exactly 2 decimal places (e.g.
        # "39.99").
        amount:,
        # The 3-character source currency code (e.g. "USD", "CAD").
        from:,
        # The 3-character target currency code. Must be either "GBP" or "EUR".
        to:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: String,
            from: String,
            to: VatSense::CurrencyConvertParams::To::OrSymbol,
            request_options: VatSense::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The 3-character target currency code. Must be either "GBP" or "EUR".
      module To
        extend VatSense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, VatSense::CurrencyConvertParams::To) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GBP = T.let(:GBP, VatSense::CurrencyConvertParams::To::TaggedSymbol)
        EUR = T.let(:EUR, VatSense::CurrencyConvertParams::To::TaggedSymbol)

        sig do
          override.returns(
            T::Array[VatSense::CurrencyConvertParams::To::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

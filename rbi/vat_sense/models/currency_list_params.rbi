# typed: strong

module VatSense
  module Models
    class CurrencyListParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(VatSense::CurrencyListParams, VatSense::Internal::AnyHash)
        end

      # The 3-character currency code(s) to convert from (e.g. "USD", "CAD"). Can be a
      # comma-separated list without spaces (e.g. "USD,CAD,AUD").
      sig { returns(T.nilable(String)) }
      attr_reader :from

      sig { params(from: String).void }
      attr_writer :from

      # The 3-character target currency code. Must be either "GBP" or "EUR".
      sig { returns(T.nilable(VatSense::CurrencyListParams::To::OrSymbol)) }
      attr_reader :to

      sig { params(to: VatSense::CurrencyListParams::To::OrSymbol).void }
      attr_writer :to

      sig do
        params(
          from: String,
          to: VatSense::CurrencyListParams::To::OrSymbol,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The 3-character currency code(s) to convert from (e.g. "USD", "CAD"). Can be a
        # comma-separated list without spaces (e.g. "USD,CAD,AUD").
        from: nil,
        # The 3-character target currency code. Must be either "GBP" or "EUR".
        to: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            from: String,
            to: VatSense::CurrencyListParams::To::OrSymbol,
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
          T.type_alias { T.all(Symbol, VatSense::CurrencyListParams::To) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GBP = T.let(:GBP, VatSense::CurrencyListParams::To::TaggedSymbol)
        EUR = T.let(:EUR, VatSense::CurrencyListParams::To::TaggedSymbol)

        sig do
          override.returns(
            T::Array[VatSense::CurrencyListParams::To::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

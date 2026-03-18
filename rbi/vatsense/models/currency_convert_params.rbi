# typed: strong

module Vatsense
  module Models
    class CurrencyConvertParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Vatsense::CurrencyConvertParams, Vatsense::Internal::AnyHash)
        end

      # The amount to convert. Must be a string with exactly 2 decimal places (e.g.
      # "39.99").
      sig { returns(String) }
      attr_accessor :amount

      # The 3-character source currency code (e.g. "USD", "CAD").
      sig { returns(String) }
      attr_accessor :from

      # The 3-character target currency code. Must be either "GBP" or "EUR".
      sig { returns(Vatsense::CurrencyConvertParams::To::OrSymbol) }
      attr_accessor :to

      sig do
        params(
          amount: String,
          from: String,
          to: Vatsense::CurrencyConvertParams::To::OrSymbol,
          request_options: Vatsense::RequestOptions::OrHash
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
            to: Vatsense::CurrencyConvertParams::To::OrSymbol,
            request_options: Vatsense::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The 3-character target currency code. Must be either "GBP" or "EUR".
      module To
        extend Vatsense::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Vatsense::CurrencyConvertParams::To) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GBP = T.let(:GBP, Vatsense::CurrencyConvertParams::To::TaggedSymbol)
        EUR = T.let(:EUR, Vatsense::CurrencyConvertParams::To::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Vatsense::CurrencyConvertParams::To::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

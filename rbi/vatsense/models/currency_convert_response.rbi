# typed: strong

module Vatsense
  module Models
    class CurrencyConvertResponse < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Vatsense::Models::CurrencyConvertResponse,
            Vatsense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig do
        returns(T.nilable(Vatsense::Models::CurrencyConvertResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data: Vatsense::Models::CurrencyConvertResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          code: Integer,
          data: Vatsense::Models::CurrencyConvertResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data: Vatsense::Models::CurrencyConvertResponse::Data,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Vatsense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Vatsense::Models::CurrencyConvertResponse::Data,
              Vatsense::Internal::AnyHash
            )
          end

        # The original amount.
        sig { returns(T.nilable(Float)) }
        attr_reader :amount

        sig { params(amount: Float).void }
        attr_writer :amount

        # The converted amount.
        sig { returns(T.nilable(Float)) }
        attr_reader :converted

        sig { params(converted: Float).void }
        attr_writer :converted

        sig { returns(T.nilable(String)) }
        attr_reader :from

        sig { params(from: String).void }
        attr_writer :from

        sig do
          returns(
            T.nilable(
              Vatsense::Models::CurrencyConvertResponse::Data::Object::TaggedSymbol
            )
          )
        end
        attr_reader :object

        sig do
          params(
            object:
              Vatsense::Models::CurrencyConvertResponse::Data::Object::OrSymbol
          ).void
        end
        attr_writer :object

        # The exchange rate used.
        sig { returns(T.nilable(Float)) }
        attr_reader :rate

        sig { params(rate: Float).void }
        attr_writer :rate

        sig { returns(T.nilable(String)) }
        attr_reader :to

        sig { params(to: String).void }
        attr_writer :to

        sig do
          params(
            amount: Float,
            converted: Float,
            from: String,
            object:
              Vatsense::Models::CurrencyConvertResponse::Data::Object::OrSymbol,
            rate: Float,
            to: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The original amount.
          amount: nil,
          # The converted amount.
          converted: nil,
          from: nil,
          object: nil,
          # The exchange rate used.
          rate: nil,
          to: nil
        )
        end

        sig do
          override.returns(
            {
              amount: Float,
              converted: Float,
              from: String,
              object:
                Vatsense::Models::CurrencyConvertResponse::Data::Object::TaggedSymbol,
              rate: Float,
              to: String
            }
          )
        end
        def to_hash
        end

        module Object
          extend Vatsense::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Vatsense::Models::CurrencyConvertResponse::Data::Object
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONVERSION =
            T.let(
              :conversion,
              Vatsense::Models::CurrencyConvertResponse::Data::Object::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Vatsense::Models::CurrencyConvertResponse::Data::Object::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

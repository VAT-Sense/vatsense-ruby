# typed: strong

module VatSense
  module Models
    class CurrencyListResponse < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            VatSense::Models::CurrencyListResponse,
            VatSense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig do
        returns(
          T.nilable(T::Array[VatSense::Models::CurrencyListResponse::Data])
        )
      end
      attr_reader :data

      sig do
        params(
          data: T::Array[VatSense::Models::CurrencyListResponse::Data::OrHash]
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
          data: T::Array[VatSense::Models::CurrencyListResponse::Data::OrHash],
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data: T::Array[VatSense::Models::CurrencyListResponse::Data],
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < VatSense::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              VatSense::Models::CurrencyListResponse::Data,
              VatSense::Internal::AnyHash
            )
          end

        # The 3-character source currency code.
        sig { returns(T.nilable(String)) }
        attr_reader :from

        sig { params(from: String).void }
        attr_writer :from

        sig do
          returns(
            T.nilable(
              VatSense::Models::CurrencyListResponse::Data::Object::TaggedSymbol
            )
          )
        end
        attr_reader :object

        sig do
          params(
            object:
              VatSense::Models::CurrencyListResponse::Data::Object::OrSymbol
          ).void
        end
        attr_writer :object

        # The exchange rate.
        sig { returns(T.nilable(Float)) }
        attr_reader :rate

        sig { params(rate: Float).void }
        attr_writer :rate

        # The 3-character target currency code (GBP or EUR).
        sig { returns(T.nilable(String)) }
        attr_reader :to

        sig { params(to: String).void }
        attr_writer :to

        sig do
          params(
            from: String,
            object:
              VatSense::Models::CurrencyListResponse::Data::Object::OrSymbol,
            rate: Float,
            to: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The 3-character source currency code.
          from: nil,
          object: nil,
          # The exchange rate.
          rate: nil,
          # The 3-character target currency code (GBP or EUR).
          to: nil
        )
        end

        sig do
          override.returns(
            {
              from: String,
              object:
                VatSense::Models::CurrencyListResponse::Data::Object::TaggedSymbol,
              rate: Float,
              to: String
            }
          )
        end
        def to_hash
        end

        module Object
          extend VatSense::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                VatSense::Models::CurrencyListResponse::Data::Object
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONVERT_RATE =
            T.let(
              :convert_rate,
              VatSense::Models::CurrencyListResponse::Data::Object::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                VatSense::Models::CurrencyListResponse::Data::Object::TaggedSymbol
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

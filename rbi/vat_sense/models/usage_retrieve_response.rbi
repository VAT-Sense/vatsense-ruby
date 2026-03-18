# typed: strong

module VatSense
  module Models
    class UsageRetrieveResponse < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            VatSense::Models::UsageRetrieveResponse,
            VatSense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig { returns(T.nilable(VatSense::Models::UsageRetrieveResponse::Data)) }
      attr_reader :data

      sig do
        params(data: VatSense::Models::UsageRetrieveResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          code: Integer,
          data: VatSense::Models::UsageRetrieveResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data: VatSense::Models::UsageRetrieveResponse::Data,
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
              VatSense::Models::UsageRetrieveResponse::Data,
              VatSense::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(VatSense::Models::UsageRetrieveResponse::Data::Requests)
          )
        end
        attr_reader :requests

        sig do
          params(
            requests:
              VatSense::Models::UsageRetrieveResponse::Data::Requests::OrHash
          ).void
        end
        attr_writer :requests

        sig do
          params(
            requests:
              VatSense::Models::UsageRetrieveResponse::Data::Requests::OrHash
          ).returns(T.attached_class)
        end
        def self.new(requests: nil)
        end

        sig do
          override.returns(
            {
              requests: VatSense::Models::UsageRetrieveResponse::Data::Requests
            }
          )
        end
        def to_hash
        end

        class Requests < VatSense::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                VatSense::Models::UsageRetrieveResponse::Data::Requests,
                VatSense::Internal::AnyHash
              )
            end

          # Requests remaining before the limit is reached.
          sig { returns(T.nilable(Integer)) }
          attr_reader :remaining

          sig { params(remaining: Integer).void }
          attr_writer :remaining

          # Total requests allowed on your plan.
          sig { returns(T.nilable(Integer)) }
          attr_reader :total

          sig { params(total: Integer).void }
          attr_writer :total

          # Requests used in the last 30 days.
          sig { returns(T.nilable(Integer)) }
          attr_reader :used

          sig { params(used: Integer).void }
          attr_writer :used

          sig do
            params(remaining: Integer, total: Integer, used: Integer).returns(
              T.attached_class
            )
          end
          def self.new(
            # Requests remaining before the limit is reached.
            remaining: nil,
            # Total requests allowed on your plan.
            total: nil,
            # Requests used in the last 30 days.
            used: nil
          )
          end

          sig do
            override.returns(
              { remaining: Integer, total: Integer, used: Integer }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

# typed: strong

module VatSense
  module Models
    class SandboxGenerateKeyResponse < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            VatSense::Models::SandboxGenerateKeyResponse,
            VatSense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig do
        returns(T.nilable(VatSense::Models::SandboxGenerateKeyResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data: VatSense::Models::SandboxGenerateKeyResponse::Data::OrHash
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
          data: VatSense::Models::SandboxGenerateKeyResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data: VatSense::Models::SandboxGenerateKeyResponse::Data,
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
              VatSense::Models::SandboxGenerateKeyResponse::Data,
              VatSense::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :allowed_endpoints

        sig { params(allowed_endpoints: T::Array[String]).void }
        attr_writer :allowed_endpoints

        sig { returns(T.nilable(Time)) }
        attr_reader :expires_at

        sig { params(expires_at: Time).void }
        attr_writer :expires_at

        # The temporary sandbox API key.
        sig { returns(T.nilable(String)) }
        attr_reader :key

        sig { params(key: String).void }
        attr_writer :key

        sig { returns(T.nilable(Integer)) }
        attr_reader :requests_remaining

        sig { params(requests_remaining: Integer).void }
        attr_writer :requests_remaining

        sig { returns(T.nilable(String)) }
        attr_reader :signup_url

        sig { params(signup_url: String).void }
        attr_writer :signup_url

        sig do
          params(
            allowed_endpoints: T::Array[String],
            expires_at: Time,
            key: String,
            requests_remaining: Integer,
            signup_url: String
          ).returns(T.attached_class)
        end
        def self.new(
          allowed_endpoints: nil,
          expires_at: nil,
          # The temporary sandbox API key.
          key: nil,
          requests_remaining: nil,
          signup_url: nil
        )
        end

        sig do
          override.returns(
            {
              allowed_endpoints: T::Array[String],
              expires_at: Time,
              key: String,
              requests_remaining: Integer,
              signup_url: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

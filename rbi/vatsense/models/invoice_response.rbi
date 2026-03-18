# typed: strong

module Vatsense
  module Models
    class InvoiceResponse < Vatsense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Vatsense::InvoiceResponse, Vatsense::Internal::AnyHash)
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig { returns(T.nilable(Vatsense::InvoiceAPI)) }
      attr_reader :data

      sig { params(data: Vatsense::InvoiceAPI::OrHash).void }
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          code: Integer,
          data: Vatsense::InvoiceAPI::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          { code: Integer, data: Vatsense::InvoiceAPI, success: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end

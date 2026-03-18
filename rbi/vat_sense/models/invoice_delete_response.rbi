# typed: strong

module VatSense
  module Models
    class InvoiceDeleteResponse < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            VatSense::Models::InvoiceDeleteResponse,
            VatSense::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :code

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(code: Integer, success: T::Boolean).returns(T.attached_class)
      end
      def self.new(code:, success:)
      end

      sig { override.returns({ code: Integer, success: T::Boolean }) }
      def to_hash
      end
    end
  end
end

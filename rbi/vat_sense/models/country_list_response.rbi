# typed: strong

module VatSense
  module Models
    class CountryListResponse < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            VatSense::Models::CountryListResponse,
            VatSense::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      sig { returns(T.nilable(T::Array[VatSense::Country])) }
      attr_reader :data

      sig { params(data: T::Array[VatSense::Country::OrHash]).void }
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          code: Integer,
          data: T::Array[VatSense::Country::OrHash],
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(code: nil, data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            code: Integer,
            data: T::Array[VatSense::Country],
            success: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end

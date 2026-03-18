# typed: strong

module VatSense
  module Models
    class InvoiceConversionInput < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(VatSense::InvoiceConversionInput, VatSense::Internal::AnyHash)
        end

      # The 3-character currency code for the conversion.
      sig { returns(String) }
      attr_accessor :currency_code

      # The rate of conversion.
      sig { returns(Float) }
      attr_accessor :rate

      sig do
        params(currency_code: String, rate: Float).returns(T.attached_class)
      end
      def self.new(
        # The 3-character currency code for the conversion.
        currency_code:,
        # The rate of conversion.
        rate:
      )
      end

      sig { override.returns({ currency_code: String, rate: Float }) }
      def to_hash
      end
    end
  end
end

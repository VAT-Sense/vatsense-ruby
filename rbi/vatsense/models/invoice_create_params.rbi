# typed: strong

module Vatsense
  module Models
    class InvoiceCreateParams < Vatsense::Models::CreateInvoice
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Vatsense::InvoiceCreateParams, Vatsense::Internal::AnyHash)
        end

      sig do
        params(request_options: Vatsense::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Vatsense::RequestOptions }) }
      def to_hash
      end
    end
  end
end

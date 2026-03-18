# typed: strong

module Vatsense
  module Models
    module Invoice
      class ItemAddParams < Vatsense::Internal::Type::BaseModel
        extend Vatsense::Internal::Type::RequestParameters::Converter
        include Vatsense::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Vatsense::Invoice::ItemAddParams, Vatsense::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :invoice_id

        sig { returns(T::Array[Vatsense::Invoice::InvoiceItemInput]) }
        attr_accessor :items

        sig do
          params(
            invoice_id: String,
            items: T::Array[Vatsense::Invoice::InvoiceItemInput::OrHash],
            request_options: Vatsense::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(invoice_id:, items:, request_options: {})
        end

        sig do
          override.returns(
            {
              invoice_id: String,
              items: T::Array[Vatsense::Invoice::InvoiceItemInput],
              request_options: Vatsense::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

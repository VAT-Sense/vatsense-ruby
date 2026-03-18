# typed: strong

module VatSense
  module Models
    class InvoiceListParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(VatSense::InvoiceListParams, VatSense::Internal::AnyHash)
        end

      # Number of invoices to return (default 10, max 100).
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Number of invoices to skip (default 0).
      sig { returns(T.nilable(Integer)) }
      attr_reader :offset

      sig { params(offset: Integer).void }
      attr_writer :offset

      # Search query to filter invoices.
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      sig do
        params(
          limit: Integer,
          offset: Integer,
          search: String,
          request_options: VatSense::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of invoices to return (default 10, max 100).
        limit: nil,
        # Number of invoices to skip (default 0).
        offset: nil,
        # Search query to filter invoices.
        search: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            limit: Integer,
            offset: Integer,
            search: String,
            request_options: VatSense::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Invoice#list
    class InvoiceListParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      # @!attribute limit
      #   Number of invoices to return (default 10, max 100).
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute offset
      #   Number of invoices to skip (default 0).
      #
      #   @return [Integer, nil]
      optional :offset, Integer

      # @!attribute search
      #   Search query to filter invoices.
      #
      #   @return [String, nil]
      optional :search, String

      # @!method initialize(limit: nil, offset: nil, search: nil, request_options: {})
      #   @param limit [Integer] Number of invoices to return (default 10, max 100).
      #
      #   @param offset [Integer] Number of invoices to skip (default 0).
      #
      #   @param search [String] Search query to filter invoices.
      #
      #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

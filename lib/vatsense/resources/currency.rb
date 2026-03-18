# frozen_string_literal: true

module Vatsense
  module Resources
    # Currency exchange rates and conversion
    class Currency
      # Some parameter documentations has been truncated, see
      # {Vatsense::Models::CurrencyListParams} for more details.
      #
      # Returns a list of all currency conversion rates sourced from HMRC (GBP) and the
      # European Central Bank (EUR).
      #
      # You can optionally filter by source and target currency.
      #
      # @overload list(from: nil, to: nil, request_options: {})
      #
      # @param from [String] The 3-character currency code(s) to convert from (e.g. "USD", "CAD").
      #
      # @param to [Symbol, Vatsense::Models::CurrencyListParams::To] The 3-character target currency code. Must be either "GBP" or "EUR".
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::CurrencyListResponse]
      #
      # @see Vatsense::Models::CurrencyListParams
      def list(params = {})
        parsed, options = Vatsense::CurrencyListParams.dump_request(params)
        query = Vatsense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "currency",
          query: query,
          model: Vatsense::Models::CurrencyListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Vatsense::Models::CurrencyCalculateVatPriceParams} for more details.
      #
      # Calculate the inclusive and exclusive VAT price on a given amount and VAT rate.
      # This is a standalone calculation that does not look up rates by country.
      #
      # @overload calculate_vat_price(price:, tax_type:, vat_rate:, request_options: {})
      #
      # @param price [String] The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
      #
      # @param tax_type [Symbol, Vatsense::Models::CurrencyCalculateVatPriceParams::TaxType] Whether the provided price is inclusive or exclusive of VAT.
      #
      # @param vat_rate [Float] A percentage VAT rate to use for the calculation.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::CurrencyCalculateVatPriceResponse]
      #
      # @see Vatsense::Models::CurrencyCalculateVatPriceParams
      def calculate_vat_price(params)
        parsed, options = Vatsense::CurrencyCalculateVatPriceParams.dump_request(params)
        query = Vatsense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "currency/price",
          query: query,
          model: Vatsense::Models::CurrencyCalculateVatPriceResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Vatsense::Models::CurrencyConvertParams} for more details.
      #
      # Convert a foreign currency amount to either GBP or EUR using official exchange
      # rates.
      #
      # GBP rates are from HMRC (updated on the 1st of every month). EUR rates are from
      # the European Central Bank (updated around 16:00 CET on working days).
      #
      # @overload convert(amount:, from:, to:, request_options: {})
      #
      # @param amount [String] The amount to convert. Must be a string with exactly 2 decimal places (e.g. "39.
      #
      # @param from [String] The 3-character source currency code (e.g. "USD", "CAD").
      #
      # @param to [Symbol, Vatsense::Models::CurrencyConvertParams::To] The 3-character target currency code. Must be either "GBP" or "EUR".
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::CurrencyConvertResponse]
      #
      # @see Vatsense::Models::CurrencyConvertParams
      def convert(params)
        parsed, options = Vatsense::CurrencyConvertParams.dump_request(params)
        query = Vatsense::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "currency/convert",
          query: query,
          model: Vatsense::Models::CurrencyConvertResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Vatsense::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end

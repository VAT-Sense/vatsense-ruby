# typed: strong

module Vatsense
  module Resources
    # Currency exchange rates and conversion
    class Currency
      # Returns a list of all currency conversion rates sourced from HMRC (GBP) and the
      # European Central Bank (EUR).
      #
      # You can optionally filter by source and target currency.
      sig do
        params(
          from: String,
          to: Vatsense::CurrencyListParams::To::OrSymbol,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::CurrencyListResponse)
      end
      def list(
        # The 3-character currency code(s) to convert from (e.g. "USD", "CAD"). Can be a
        # comma-separated list without spaces (e.g. "USD,CAD,AUD").
        from: nil,
        # The 3-character target currency code. Must be either "GBP" or "EUR".
        to: nil,
        request_options: {}
      )
      end

      # Calculate the inclusive and exclusive VAT price on a given amount and VAT rate.
      # This is a standalone calculation that does not look up rates by country.
      sig do
        params(
          price: String,
          tax_type:
            Vatsense::CurrencyCalculateVatPriceParams::TaxType::OrSymbol,
          vat_rate: Float,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::CurrencyCalculateVatPriceResponse)
      end
      def calculate_vat_price(
        # The price to calculate on. Must be a string with exactly 2 decimal places (e.g.
        # "30.00", "59.95").
        price:,
        # Whether the provided price is inclusive or exclusive of VAT.
        tax_type:,
        # A percentage VAT rate to use for the calculation.
        vat_rate:,
        request_options: {}
      )
      end

      # Convert a foreign currency amount to either GBP or EUR using official exchange
      # rates.
      #
      # GBP rates are from HMRC (updated on the 1st of every month). EUR rates are from
      # the European Central Bank (updated around 16:00 CET on working days).
      sig do
        params(
          amount: String,
          from: String,
          to: Vatsense::CurrencyConvertParams::To::OrSymbol,
          request_options: Vatsense::RequestOptions::OrHash
        ).returns(Vatsense::Models::CurrencyConvertResponse)
      end
      def convert(
        # The amount to convert. Must be a string with exactly 2 decimal places (e.g.
        # "39.99").
        amount:,
        # The 3-character source currency code (e.g. "USD", "CAD").
        from:,
        # The 3-character target currency code. Must be either "GBP" or "EUR".
        to:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Vatsense::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

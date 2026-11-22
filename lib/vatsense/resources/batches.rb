# frozen_string_literal: true

module Vatsense
  module Resources
    # Bulk validation: check many VAT numbers in one batch.
    #
    # Batch calls are free and work even when your requests are used up; each
    # number a batch checks counts as one request. With a test key a batch is
    # answered from the test numbers, is free and holds at most 1,000 numbers.
    class Batches
      BODY_KEYS = [:numbers, :rows, :reference, :start, :shortfall, :auto_continue, :consultation].freeze
      private_constant :BODY_KEYS

      # Create a batch of VAT numbers and, by default, start checking it. Pass
      # exactly one of `numbers:` or `rows:`.
      #
      # @overload create(numbers: nil, rows: nil, reference: nil, start: nil, shortfall: nil, auto_continue: nil, consultation: nil, idempotency_key: nil, request_options: {})
      #
      # @param numbers [Array<String>] The VAT numbers to check, each with its 2-character country code.
      #
      # @param rows [Array<Hash{Symbol=>String}>] Rows with `vat_number:` and, for company matching, any of
      #   `country_code:`, `company_name:`, `address:`, `street:`, `address_line_2:`, `postcode:` and `city:`.
      #
      # @param reference [String] Your own label for the batch, at most 255 characters.
      #
      # @param start [Boolean] Defaults to true. False keeps a draft for 24 hours, to start with `start`.
      #
      # @param shortfall [Symbol, String] When your requests do not cover the batch: `:wait` (the default)
      #   starts nothing and returns the `quote`, `:pause` checks what is covered and pauses the rest,
      #   `:overage` runs into overage (it must already be on in the dashboard).
      #
      # @param auto_continue [Boolean] Defaults to true. With `:pause`, continue when your requests renew.
      #
      # @param consultation [Boolean] Defaults to false. Send the requester VAT number from your account
      #   settings with each check.
      #
      # @param idempotency_key [String] Sent as the `Idempotency-Key` header, at most 64 characters. The
      #   same key again returns the batch already made.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchResponse]
      def create(params = {})
        params = params.dup
        options = params.delete(:request_options)
        key = params.delete(:idempotency_key)
        @client.request(
          method: :post,
          path: "batches",
          headers: key.nil? ? {} : {"idempotency-key" => key},
          body: body_of(params),
          model: Vatsense::Models::BatchResponse,
          options: options
        )
      end

      # The account's batches, newest first.
      #
      # @overload list(page: nil, limit: nil, status: nil, request_options: {})
      #
      # @param page [Integer] The page, from 1.
      #
      # @param limit [Integer] Batches a page, 1 to 100 (default 25).
      #
      # @param status [Symbol, String] `:draft` lists the drafts not yet started instead.
      #
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchListResponse]
      def list(params = {})
        params = params.dup
        options = params.delete(:request_options)
        @client.request(
          method: :get,
          path: "batches",
          query: query_of(params, [:page, :limit, :status]),
          model: Vatsense::Models::BatchListResponse,
          options: options
        )
      end

      # A batch and its progress. Poll until `status` is `complete`, or take the
      # `batch.completed` webhook.
      #
      # @overload retrieve(batch_id, request_options: {})
      #
      # @param batch_id [String]
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchResponse]
      def retrieve(batch_id, params = {})
        action(:get, batch_id, nil, nil, params)
      end

      # Delete a draft. A batch that has started cannot be deleted (409).
      #
      # @overload delete(batch_id, request_options: {})
      #
      # @param batch_id [String]
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchDeleteResponse]
      def delete(batch_id, params = {})
        @client.request(
          method: :delete,
          path: ["batches/%1$s", id_of(batch_id)],
          model: Vatsense::Models::BatchDeleteResponse,
          options: params[:request_options]
        )
      end

      # Start a draft, with the same options as `create`.
      #
      # @overload start(batch_id, shortfall: nil, auto_continue: nil, consultation: nil, request_options: {})
      #
      # @param batch_id [String]
      # @param shortfall [Symbol, String]
      # @param auto_continue [Boolean]
      # @param consultation [Boolean]
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchResponse]
      def start(batch_id, params = {})
        action(:post, batch_id, "start", [:shortfall, :auto_continue, :consultation], params)
      end

      # Pause a running batch.
      #
      # @overload pause(batch_id, request_options: {})
      #
      # @param batch_id [String]
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchResponse]
      def pause(batch_id, params = {})
        action(:post, batch_id, "pause", [], params)
      end

      # Continue a paused batch. Pass `shortfall: :overage` to run into overage.
      #
      # @overload continue(batch_id, shortfall: nil, request_options: {})
      #
      # @param batch_id [String]
      # @param shortfall [Symbol, String]
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchResponse]
      def continue(batch_id, params = {})
        action(:post, batch_id, "continue", [:shortfall], params)
      end

      # Mark a paused batch complete, leaving the rest unchecked.
      #
      # @overload complete(batch_id, request_options: {})
      #
      # @param batch_id [String]
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchResponse]
      def complete(batch_id, params = {})
        action(:post, batch_id, "complete", [], params)
      end

      # The batch's checked rows as JSON, in row order. Follow `next_after` while
      # `has_more` is true.
      #
      # @overload results(batch_id, after: nil, limit: nil, request_options: {})
      #
      # @param batch_id [String]
      # @param after [Integer] Return rows after this row number (default 0).
      # @param limit [Integer] Rows a page, 1 to 1,000 (default 100).
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Vatsense::Models::BatchResultsResponse]
      def results(batch_id, params = {})
        params = params.dup
        options = params.delete(:request_options)
        @client.request(
          method: :get,
          path: ["batches/%1$s/results", id_of(batch_id)],
          query: query_of(params, [:after, :limit]),
          model: Vatsense::Models::BatchResultsResponse,
          options: options
        )
      end

      # The batch's CSV report, the same file the dashboard gives.
      #
      # @overload results_csv(batch_id, request_options: {})
      #
      # @param batch_id [String]
      # @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      def results_csv(batch_id, params = {})
        body = @client.request(
          method: :get,
          path: ["batches/%1$s/results.csv", id_of(batch_id)],
          headers: {"accept" => "text/csv"},
          model: StringIO,
          options: params[:request_options]
        )
        body.respond_to?(:read) ? body.read : body.to_s
      end

      # @api private
      #
      # @param client [Vatsense::Client]
      def initialize(client:)
        @client = client
      end

      private

      def action(method, batch_id, suffix, keys, params)
        params = params.dup
        options = params.delete(:request_options)
        path = suffix.nil? ? "batches/%1$s" : "batches/%1$s/#{suffix}"
        @client.request(
          method: method,
          path: [path, id_of(batch_id)],
          body: keys.nil? ? nil : body_of(params.slice(*keys)),
          model: Vatsense::Models::BatchResponse,
          options: options
        )
      end

      def id_of(batch_id)
        raise ArgumentError, "batch_id must not be empty" if batch_id.nil? || batch_id.to_s.empty?

        batch_id
      end

      def body_of(params)
        unknown = params.keys - BODY_KEYS
        raise ArgumentError, "unknown batch parameters: #{unknown.join(', ')}" unless unknown.empty?

        params.compact.transform_values { _1.is_a?(Symbol) ? _1.to_s : _1 }
      end

      def query_of(params, keys)
        unknown = params.keys - keys
        raise ArgumentError, "unknown batch parameters: #{unknown.join(', ')}" unless unknown.empty?

        params.compact.transform_values(&:to_s)
      end
    end
  end
end

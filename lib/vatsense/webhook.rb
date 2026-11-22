# frozen_string_literal: true

module Vatsense
  # Checks the `VatSense-Signature` header of webhook events.
  #
  # Every event is a signed JSON `POST` with a header such as
  # `t=1793365200,v1=5257a8...`: `v1` is the hex HMAC-SHA256 of the timestamp, a
  # full stop and the raw request body, keyed with the endpoint's signing secret
  # (`whsec_...`). For 24 hours after a secret is rolled the header carries a
  # second `v1`, so any match is accepted.
  #
  # @example
  #   event = Vatsense::Webhook.construct_event(
  #     request.raw_post,
  #     request.headers[Vatsense::Webhook::SIGNATURE_HEADER],
  #     ENV.fetch("VATSENSE_WEBHOOK_SECRET")
  #   )
  module Webhook
    # The name of the header that carries the signature.
    SIGNATURE_HEADER = "VatSense-Signature"

    # Events whose timestamp is more than this many seconds from now are refused.
    DEFAULT_TOLERANCE = 300

    # The event's signature is missing, malformed, too old or does not match.
    class SignatureError < Vatsense::Errors::Error; end

    class << self
      # Check an event's signature header against its raw body, exactly as received.
      #
      # @param payload [String] the raw request body
      # @param header [String, nil] the value of the `VatSense-Signature` header
      # @param secret [String] the endpoint's signing secret, starting `whsec_`
      # @param tolerance [Integer, nil] refuse events signed more than this many seconds ago; nil skips the check
      # @param now [Integer, nil] the current Unix time, for tests
      #
      # @raise [Vatsense::Webhook::SignatureError]
      # @return [true]
      def verify_signature(payload, header, secret, tolerance: DEFAULT_TOLERANCE, now: nil)
        raise SignatureError, "The VatSense-Signature header is missing." if header.nil? || header.empty?
        raise SignatureError, "No signing secret was given." if secret.nil? || secret.empty?

        timestamp = nil
        signatures = []
        header.split(",").each do |part|
          key, value = part.strip.split("=", 2)
          next if value.nil?

          case key
          in "t"
            raise SignatureError, "The signature header's timestamp is not a number." unless value.match?(/\A\d+\z/)

            timestamp = Integer(value, 10)
          in "v1"
            signatures << value unless value.empty?
          else
            nil
          end
        end
        raise SignatureError, "The signature header has no timestamp." if timestamp.nil?
        raise SignatureError, "The signature header has no v1 signature." if signatures.empty?

        current = now || Time.now.to_i
        if !tolerance.nil? && (current - timestamp).abs > tolerance
          raise SignatureError, "The event's timestamp is outside the tolerance."
        end

        expected = OpenSSL::HMAC.hexdigest("SHA256", secret, "#{timestamp}.#{payload}")
        return true if signatures.any? { secure_compare(expected, _1) }

        raise SignatureError, "No signature matches the payload."
      end

      # Check the signature, then return the event (`id`, `type`, `created`,
      # `livemode`, `data`) as a Hash with symbol keys.
      #
      # @param payload [String]
      # @param header [String, nil]
      # @param secret [String]
      # @param tolerance [Integer, nil]
      # @param now [Integer, nil]
      #
      # @raise [Vatsense::Webhook::SignatureError]
      # @return [Hash{Symbol=>Object}]
      def construct_event(payload, header, secret, tolerance: DEFAULT_TOLERANCE, now: nil)
        verify_signature(payload, header, secret, tolerance: tolerance, now: now)
        event = JSON.parse(payload, symbolize_names: true)
        raise SignatureError, "The payload is not a JSON object." unless event.is_a?(Hash)

        event
      rescue JSON::ParserError
        raise SignatureError, "The payload is not JSON."
      end

      private

      def secure_compare(expected, given)
        return false unless expected.bytesize == given.bytesize

        OpenSSL.fixed_length_secure_compare(expected, given)
      end
    end
  end
end

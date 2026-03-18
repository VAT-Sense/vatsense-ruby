# frozen_string_literal: true

module VatSense
  class Client < VatSense::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Use HTTP Basic Auth with username `user` and your API key as the password.
    # @return [String]
    attr_reader :username

    # Use HTTP Basic Auth with username `user` and your API key as the password.
    # @return [String]
    attr_reader :password

    # VAT/GST rate lookups for countries worldwide
    # @return [VatSense::Resources::Rates]
    attr_reader :rates

    # Country and province information
    # @return [VatSense::Resources::Countries]
    attr_reader :countries

    # VAT and EORI number validation
    # @return [VatSense::Resources::Validate]
    attr_reader :validate

    # Currency exchange rates and conversion
    # @return [VatSense::Resources::Currency]
    attr_reader :currency

    # VAT-compliant invoice management
    # @return [VatSense::Resources::Invoice]
    attr_reader :invoice

    # API usage statistics
    # @return [VatSense::Resources::Usage]
    attr_reader :usage

    # Temporary sandbox API keys for testing
    # @return [VatSense::Resources::Sandbox]
    attr_reader :sandbox

    # @api private
    #
    # @param security [Hash{Symbol=>Boolean}]
    #
    # @return [Hash{String=>String}]
    private def auth_headers(security:)
      {basic_auth:}.slice(*security.keys).values.reduce({}, :merge)
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def basic_auth
      return {} if @username.nil? || @password.nil?

      base64_credentials = ["#{@username}:#{@password}"].pack("m0")
      {"authorization" => "Basic #{base64_credentials}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param username [String, nil] Use HTTP Basic Auth with username `user` and your API key as the password.
    # Defaults to `ENV["VAT_SENSE_USERNAME"]`
    #
    # @param password [String, nil] Use HTTP Basic Auth with username `user` and your API key as the password.
    # Defaults to `ENV["VAT_SENSE_PASSWORD"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["VAT_SENSE_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      username: ENV["VAT_SENSE_USERNAME"],
      password: ENV["VAT_SENSE_PASSWORD"],
      base_url: ENV["VAT_SENSE_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.vatsense.com/1.0"

      if username.nil?
        raise ArgumentError.new("username is required, and can be set via environ: \"VAT_SENSE_USERNAME\"")
      end
      if password.nil?
        raise ArgumentError.new("password is required, and can be set via environ: \"VAT_SENSE_PASSWORD\"")
      end

      @username = username.to_s
      @password = password.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @rates = VatSense::Resources::Rates.new(client: self)
      @countries = VatSense::Resources::Countries.new(client: self)
      @validate = VatSense::Resources::Validate.new(client: self)
      @currency = VatSense::Resources::Currency.new(client: self)
      @invoice = VatSense::Resources::Invoice.new(client: self)
      @usage = VatSense::Resources::Usage.new(client: self)
      @sandbox = VatSense::Resources::Sandbox.new(client: self)
    end
  end
end

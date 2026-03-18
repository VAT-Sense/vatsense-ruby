# typed: strong

module Vatsense
  class Client < Vatsense::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # Use HTTP Basic Auth with username `user` and your API key as the password.
    sig { returns(String) }
    attr_reader :username

    # Use HTTP Basic Auth with username `user` and your API key as the password.
    sig { returns(String) }
    attr_reader :password

    # VAT/GST rate lookups for countries worldwide
    sig { returns(Vatsense::Resources::Rates) }
    attr_reader :rates

    # Country and province information
    sig { returns(Vatsense::Resources::Countries) }
    attr_reader :countries

    # VAT and EORI number validation
    sig { returns(Vatsense::Resources::Validate) }
    attr_reader :validate

    # Currency exchange rates and conversion
    sig { returns(Vatsense::Resources::Currency) }
    attr_reader :currency

    # VAT-compliant invoice management
    sig { returns(Vatsense::Resources::Invoice) }
    attr_reader :invoice

    # API usage statistics
    sig { returns(Vatsense::Resources::Usage) }
    attr_reader :usage

    # Temporary sandbox API keys for testing
    sig { returns(Vatsense::Resources::Sandbox) }
    attr_reader :sandbox

    # @api private
    sig do
      override
        .params(security: { basic_auth: T::Boolean })
        .returns(T::Hash[String, String])
    end
    private def auth_headers(security:)
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def basic_auth
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        username: T.nilable(String),
        password: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Use HTTP Basic Auth with username `user` and your API key as the password.
      # Defaults to `ENV["VAT_SENSE_USERNAME"]`
      username: ENV["VAT_SENSE_USERNAME"],
      # Use HTTP Basic Auth with username `user` and your API key as the password.
      # Defaults to `ENV["VAT_SENSE_PASSWORD"]`
      password: ENV["VAT_SENSE_PASSWORD"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["VAT_SENSE_BASE_URL"]`
      base_url: ENV["VAT_SENSE_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Vatsense::Client::DEFAULT_MAX_RETRIES,
      timeout: Vatsense::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Vatsense::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Vatsense::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end

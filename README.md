# VAT Sense Ruby SDK

The official Ruby library for the [VAT Sense](https://vatsense.com) REST API. Validate VAT/EORI numbers, look up VAT/GST rates, calculate prices, convert currencies, and generate VAT-compliant invoices.

## Installation

```sh
gem install vatsense
```

Or add to your Gemfile:

```ruby
gem "vatsense"
```

Requires Ruby 3.2.0+.

## Quick start

Create a client using your API key from the [VAT Sense dashboard](https://vatsense.com/dashboard). The API uses HTTP Basic Auth with `user` as the username and your API key as the password.

```ruby
require "vatsense"

client = Vatsense::Client.new(
  username: "user",
  password: "your_api_key",
)
```

You can also set the `VAT_SENSE_USERNAME` and `VAT_SENSE_PASSWORD` environment variables and the client will pick them up automatically.

### Validate a VAT number

```ruby
response = client.validate.check(vat_number: "GB288305674")

if response.data.valid
  puts response.data.company.company_name     # "BRITISH BROADCASTING CORPORATION"
  puts response.data.company.company_address
  puts response.data.company.country_code      # "GB"
end
```

VAT validation works for the UK, EU, Australia, Norway, Switzerland, South Africa, and Brazil.

### Validate an EORI number

```ruby
response = client.validate.check(eori_number: "GB123456789000")

if response.data.valid
  puts response.data.company.company_name
end
```

EORI validation is available for UK and EU numbers only.

### Get a consultation number

If you need an official consultation number from VIES (EU) or HMRC (UK), provide your own VAT number as the requester:

```ruby
response = client.validate.check(
  vat_number: "FR12345678901",
  requester_vat_number: "FR98765432101",
)

puts response.data.consultation_number
```

> **Note:** GB requester numbers only work for GB validations, and EU requester numbers only work for EU validations. Cross-region requests are not supported.

If you would rather have an answer than wait for a consultation number when VIES is down, send `consultation_optional: true`. Where a national register can confirm the number, you get the answer with no `consultation_number` instead of the `412`.

### Check many numbers at once (batches)

A batch checks a list of VAT numbers, as the dashboard's bulk validator does with a file. Batch calls are free and each number checked counts as one request. With a test key the batch is answered from the test numbers and costs nothing.

```ruby
batch = client.batches.create(
  numbers: ["GB288305674", "FR12345678901"],
  reference: "November customers",
  idempotency_key: "november-customers",
).data

# Poll, or take the batch.completed webhook instead.
status = batch.status
until %w[complete paused expired].include?(status)
  sleep(10)
  status = client.batches.retrieve(batch.id).data.status
end

after = 0
loop do
  page = client.batches.results(batch.id, after: after, limit: 1000).data
  page.data.each { |row| puts [row.vat_number, row.result, row.company_name].join(" ") }
  break unless page.has_more

  after = page.next_after
end

csv = client.batches.results_csv(batch.id)
```

Send `rows: [{vat_number:, company_name:, postcode:}]` instead of `numbers:` for company matching. A batch can also be paused, continued (`client.batches.continue`), completed and, while a draft, deleted.

### Check a webhook's signature

Every webhook event carries a `VatSense-Signature` header. Check it against the raw request body with the endpoint's signing secret before trusting the event:

```ruby
begin
  event = Vatsense::Webhook.construct_event(
    request.raw_post,
    request.headers[Vatsense::Webhook::SIGNATURE_HEADER],
    ENV.fetch("VATSENSE_WEBHOOK_SECRET"),
  )
rescue Vatsense::Webhook::SignatureError
  head(:bad_request) and return
end

if event[:type] == "batch.completed"
  # ...
end
```

Events more than 5 minutes old are refused (change it with `tolerance:`). During the 24 hours after a secret is rolled, events signed with either secret are accepted.

### Find the VAT rate for a country

```ruby
rate = client.rates.find(country_code: "DE")

puts rate.data.country_name       # "Germany"
puts rate.data.tax_rate.rate      # 19.0
puts rate.data.tax_rate.class_    # "standard"
```

### Find a rate for a specific product type

```ruby
rate = client.rates.find(country_code: "DE", type: "ebooks")

puts rate.data.tax_rate.rate      # 7.0
puts rate.data.tax_rate.class_    # "reduced"
```

### Find a rate by IP address

Useful for determining the correct rate based on your customer's location:

```ruby
rate = client.rates.find(ip_address: "185.86.151.11")

puts rate.data.country_code       # "GB"
puts rate.data.tax_rate.rate      # 20.0
```

### Calculate a VAT-inclusive price

```ruby
result = client.rates.calculate_price(
  price: "100.00",
  tax_type: "excl",
  country_code: "FR",
)

puts result.data.vat_price.price_incl_vat  # Price including VAT
puts result.data.vat_price.price_excl_vat  # Price excluding VAT
puts result.data.vat_price.vat_rate        # VAT rate applied
puts result.data.vat_price.vat             # VAT amount
```

### List all VAT rates

```ruby
rates = client.rates.list

rates.data.each do |rate|
  puts "#{rate.country_code}: #{rate.country_name}"
end

# Filter to EU countries only
eu_rates = client.rates.list(eu: true)
```

## Handling errors

When the API returns an error, the library raises a typed exception:

```ruby
begin
  response = client.validate.check(vat_number: "GB288305674")
rescue Vatsense::Errors::APIConnectionError => e
  # Network issue, could not reach the API
  puts e.message
rescue Vatsense::Errors::RateLimitError => e
  # 429: Too many requests (300/min general limit, 3/sec for UK validation)
  puts "Rate limited, try again shortly"
rescue Vatsense::Errors::APIStatusError => e
  # Covers all other HTTP errors
  puts e.status
  puts e.message
end
```

A `412` error means the upstream validation service (VIES, HMRC, etc.) is temporarily unavailable. These requests do not count against your usage quota.

| Status Code | Error Type                                  |
| ----------- | ------------------------------------------- |
| 400         | `Vatsense::Errors::BadRequestError`         |
| 401         | `Vatsense::Errors::AuthenticationError`     |
| 404         | `Vatsense::Errors::NotFoundError`           |
| 409         | `Vatsense::Errors::ConflictError`           |
| 429         | `Vatsense::Errors::RateLimitError`          |
| >= 500      | `Vatsense::Errors::InternalServerError`     |
| N/A         | `Vatsense::Errors::APIConnectionError`      |

## Retries

Failed requests are automatically retried up to 2 times with exponential backoff. This includes connection errors, timeouts, 429, and 5xx responses.

```ruby
# Disable retries
client = Vatsense::Client.new(
  username: "user",
  password: "your_api_key",
  max_retries: 0,
)

# Or configure per request
response = client.validate.check(
  vat_number: "GB288305674",
  request_options: { max_retries: 5 },
)
```

## Available services

| Service               | Description                                     |
| --------------------- | ----------------------------------------------- |
| `client.validate`     | Validate VAT and EORI numbers                   |
| `client.rates`        | VAT/GST rate lookups, price calculations         |
| `client.countries`    | Country data and province lookups                |
| `client.currency`     | Exchange rates and currency conversion           |
| `client.batches`      | Check many VAT numbers in one batch              |
| `client.invoice`      | Create and manage VAT-compliant invoices         |
| `client.usage`        | Check your API usage                             |

## Documentation

Full API documentation is available at [vatsense.com/documentation](https://vatsense.com/documentation).

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

## Contributing

See [the contributing documentation](https://github.com/VAT-Sense/vatsense-ruby/tree/main/CONTRIBUTING.md).

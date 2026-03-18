# frozen_string_literal: true

require_relative "../test_helper"

class VatSense::Test::Resources::UsageTest < VatSense::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @vat_sense.usage.retrieve

    assert_pattern do
      response => VatSense::Models::UsageRetrieveResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::Models::UsageRetrieveResponse::Data | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end
end

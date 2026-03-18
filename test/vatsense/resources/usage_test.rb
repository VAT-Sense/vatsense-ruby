# frozen_string_literal: true

require_relative "../test_helper"

class Vatsense::Test::Resources::UsageTest < Vatsense::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @vat_sense.usage.retrieve

    assert_pattern do
      response => Vatsense::Models::UsageRetrieveResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::Models::UsageRetrieveResponse::Data | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end
end

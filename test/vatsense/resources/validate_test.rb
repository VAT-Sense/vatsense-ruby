# frozen_string_literal: true

require_relative "../test_helper"

class Vatsense::Test::Resources::ValidateTest < Vatsense::Test::ResourceTest
  def test_check
    skip("Mock server tests are disabled")

    response = @vat_sense.validate.check

    assert_pattern do
      response => Vatsense::Models::ValidateCheckResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::Models::ValidateCheckResponse::Data | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end
end

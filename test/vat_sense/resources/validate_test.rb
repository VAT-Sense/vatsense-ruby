# frozen_string_literal: true

require_relative "../test_helper"

class VatSense::Test::Resources::ValidateTest < VatSense::Test::ResourceTest
  def test_check
    skip("Mock server tests are disabled")

    response = @vat_sense.validate.check

    assert_pattern do
      response => VatSense::Models::ValidateCheckResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::Models::ValidateCheckResponse::Data | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end
end

# frozen_string_literal: true

require_relative "../test_helper"

class VatSense::Test::Resources::SandboxTest < VatSense::Test::ResourceTest
  def test_generate_key
    skip("Mock server tests are disabled")

    response = @vat_sense.sandbox.generate_key

    assert_pattern do
      response => VatSense::Models::SandboxGenerateKeyResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: VatSense::Models::SandboxGenerateKeyResponse::Data | nil,
        success: VatSense::Internal::Type::Boolean | nil
      }
    end
  end
end

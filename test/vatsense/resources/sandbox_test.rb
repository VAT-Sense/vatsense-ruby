# frozen_string_literal: true

require_relative "../test_helper"

class Vatsense::Test::Resources::SandboxTest < Vatsense::Test::ResourceTest
  def test_generate_key
    skip("Mock server tests are disabled")

    response = @vat_sense.sandbox.generate_key

    assert_pattern do
      response => Vatsense::Models::SandboxGenerateKeyResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        data: Vatsense::Models::SandboxGenerateKeyResponse::Data | nil,
        success: Vatsense::Internal::Type::Boolean | nil
      }
    end
  end
end

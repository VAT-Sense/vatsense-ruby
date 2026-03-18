# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Sandbox#generate_key
    class SandboxGenerateKeyParams < Vatsense::Internal::Type::BaseModel
      extend Vatsense::Internal::Type::RequestParameters::Converter
      include Vatsense::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Vatsense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

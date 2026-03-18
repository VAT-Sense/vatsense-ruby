# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Rates#list_types
    class RateListTypesParams < VatSense::Internal::Type::BaseModel
      extend VatSense::Internal::Type::RequestParameters::Converter
      include VatSense::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [VatSense::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

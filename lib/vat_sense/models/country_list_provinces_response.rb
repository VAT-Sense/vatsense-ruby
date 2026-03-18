# frozen_string_literal: true

module VatSense
  module Models
    # @see VatSense::Resources::Countries#list_provinces
    class CountryListProvincesResponse < VatSense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<VatSense::Models::CountryListProvincesResponse::Data>, nil]
      optional :data,
               -> { VatSense::Internal::Type::ArrayOf[VatSense::Models::CountryListProvincesResponse::Data] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, VatSense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<VatSense::Models::CountryListProvincesResponse::Data>]
      #   @param success [Boolean]

      class Data < VatSense::Internal::Type::BaseModel
        # @!attribute country_code
        #
        #   @return [String, nil]
        optional :country_code, String

        # @!attribute object
        #
        #   @return [Symbol, VatSense::Models::CountryListProvincesResponse::Data::Object, nil]
        optional :object, enum: -> { VatSense::Models::CountryListProvincesResponse::Data::Object }

        # @!attribute province_code
        #
        #   @return [String, nil]
        optional :province_code, String

        # @!attribute province_name
        #
        #   @return [String, nil]
        optional :province_name, String

        # @!method initialize(country_code: nil, object: nil, province_code: nil, province_name: nil)
        #   @param country_code [String]
        #   @param object [Symbol, VatSense::Models::CountryListProvincesResponse::Data::Object]
        #   @param province_code [String]
        #   @param province_name [String]

        # @see VatSense::Models::CountryListProvincesResponse::Data#object
        module Object
          extend VatSense::Internal::Type::Enum

          PROVINCE = :province

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Vatsense
  module Models
    # @see Vatsense::Resources::Countries#list_provinces
    class CountryListProvincesResponse < Vatsense::Internal::Type::BaseModel
      # @!attribute code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute data
      #
      #   @return [Array<Vatsense::Models::CountryListProvincesResponse::Data>, nil]
      optional :data,
               -> { Vatsense::Internal::Type::ArrayOf[Vatsense::Models::CountryListProvincesResponse::Data] }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Vatsense::Internal::Type::Boolean

      # @!method initialize(code: nil, data: nil, success: nil)
      #   @param code [Integer]
      #   @param data [Array<Vatsense::Models::CountryListProvincesResponse::Data>]
      #   @param success [Boolean]

      class Data < Vatsense::Internal::Type::BaseModel
        # @!attribute country_code
        #
        #   @return [String, nil]
        optional :country_code, String

        # @!attribute object
        #
        #   @return [Symbol, Vatsense::Models::CountryListProvincesResponse::Data::Object, nil]
        optional :object, enum: -> { Vatsense::Models::CountryListProvincesResponse::Data::Object }

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
        #   @param object [Symbol, Vatsense::Models::CountryListProvincesResponse::Data::Object]
        #   @param province_code [String]
        #   @param province_name [String]

        # @see Vatsense::Models::CountryListProvincesResponse::Data#object
        module Object
          extend Vatsense::Internal::Type::Enum

          PROVINCE = :province

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

# frozen_string_literal: true

module VatSense
  [VatSense::Internal::Type::BaseModel, *VatSense::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, VatSense::Internal::AnyHash) } }
  end

  VatSense::Internal::Util.walk_namespaces(VatSense::Models).each do |mod|
    case mod
    in VatSense::Internal::Type::Enum | VatSense::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  VatSense::Internal::Util.walk_namespaces(VatSense::Models)
                          .lazy
                          .grep(VatSense::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Country = VatSense::Models::Country

  CountryListParams = VatSense::Models::CountryListParams

  CountryListProvincesParams = VatSense::Models::CountryListProvincesParams

  CreateInvoice = VatSense::Models::CreateInvoice

  CurrencyCalculateVatPriceParams = VatSense::Models::CurrencyCalculateVatPriceParams

  CurrencyConvertParams = VatSense::Models::CurrencyConvertParams

  CurrencyListParams = VatSense::Models::CurrencyListParams

  FindRate = VatSense::Models::FindRate

  Invoice = VatSense::Models::Invoice

  InvoiceAPI = VatSense::Models::InvoiceAPI

  InvoiceBusinessInput = VatSense::Models::InvoiceBusinessInput

  InvoiceConversionInput = VatSense::Models::InvoiceConversionInput

  InvoiceCreateParams = VatSense::Models::InvoiceCreateParams

  InvoiceCustomerInput = VatSense::Models::InvoiceCustomerInput

  InvoiceDeleteParams = VatSense::Models::InvoiceDeleteParams

  InvoiceListParams = VatSense::Models::InvoiceListParams

  InvoiceResponse = VatSense::Models::InvoiceResponse

  InvoiceRetrieveParams = VatSense::Models::InvoiceRetrieveParams

  InvoiceUpdateParams = VatSense::Models::InvoiceUpdateParams

  Rate = VatSense::Models::Rate

  RateCalculatePriceParams = VatSense::Models::RateCalculatePriceParams

  RateDetailsParams = VatSense::Models::RateDetailsParams

  RateFindParams = VatSense::Models::RateFindParams

  RateListParams = VatSense::Models::RateListParams

  RateListTypesParams = VatSense::Models::RateListTypesParams

  RateWithTaxRate = VatSense::Models::RateWithTaxRate

  SandboxGenerateKeyParams = VatSense::Models::SandboxGenerateKeyParams

  TaxRate = VatSense::Models::TaxRate

  UsageRetrieveParams = VatSense::Models::UsageRetrieveParams

  ValidateCheckParams = VatSense::Models::ValidateCheckParams

  VatPrice = VatSense::Models::VatPrice
end

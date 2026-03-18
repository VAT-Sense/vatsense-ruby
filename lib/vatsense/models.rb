# frozen_string_literal: true

module Vatsense
  [Vatsense::Internal::Type::BaseModel, *Vatsense::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Vatsense::Internal::AnyHash) } }
  end

  Vatsense::Internal::Util.walk_namespaces(Vatsense::Models).each do |mod|
    case mod
    in Vatsense::Internal::Type::Enum | Vatsense::Internal::Type::Union
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

  Vatsense::Internal::Util.walk_namespaces(Vatsense::Models)
                          .lazy
                          .grep(Vatsense::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Country = Vatsense::Models::Country

  CountryListParams = Vatsense::Models::CountryListParams

  CountryListProvincesParams = Vatsense::Models::CountryListProvincesParams

  CreateInvoice = Vatsense::Models::CreateInvoice

  CurrencyCalculateVatPriceParams = Vatsense::Models::CurrencyCalculateVatPriceParams

  CurrencyConvertParams = Vatsense::Models::CurrencyConvertParams

  CurrencyListParams = Vatsense::Models::CurrencyListParams

  FindRate = Vatsense::Models::FindRate

  Invoice = Vatsense::Models::Invoice

  InvoiceAPI = Vatsense::Models::InvoiceAPI

  InvoiceBusinessInput = Vatsense::Models::InvoiceBusinessInput

  InvoiceConversionInput = Vatsense::Models::InvoiceConversionInput

  InvoiceCreateParams = Vatsense::Models::InvoiceCreateParams

  InvoiceCustomerInput = Vatsense::Models::InvoiceCustomerInput

  InvoiceDeleteParams = Vatsense::Models::InvoiceDeleteParams

  InvoiceListParams = Vatsense::Models::InvoiceListParams

  InvoiceResponse = Vatsense::Models::InvoiceResponse

  InvoiceRetrieveParams = Vatsense::Models::InvoiceRetrieveParams

  InvoiceUpdateParams = Vatsense::Models::InvoiceUpdateParams

  Rate = Vatsense::Models::Rate

  RateCalculatePriceParams = Vatsense::Models::RateCalculatePriceParams

  RateDetailsParams = Vatsense::Models::RateDetailsParams

  RateFindParams = Vatsense::Models::RateFindParams

  RateListParams = Vatsense::Models::RateListParams

  RateListTypesParams = Vatsense::Models::RateListTypesParams

  RateWithTaxRate = Vatsense::Models::RateWithTaxRate

  SandboxGenerateKeyParams = Vatsense::Models::SandboxGenerateKeyParams

  TaxRate = Vatsense::Models::TaxRate

  UsageRetrieveParams = Vatsense::Models::UsageRetrieveParams

  ValidateCheckParams = Vatsense::Models::ValidateCheckParams

  VatPrice = Vatsense::Models::VatPrice
end

# typed: strong

module VatSense
  module Models
    class InvoiceBusinessInput < VatSense::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(VatSense::InvoiceBusinessInput, VatSense::Internal::AnyHash)
        end

      # Your business trading address.
      sig { returns(String) }
      attr_accessor :address

      # Your business trading name.
      sig { returns(String) }
      attr_accessor :name

      # Your business VAT number.
      sig { returns(String) }
      attr_accessor :vat_number

      sig { returns(T.nilable(String)) }
      attr_reader :bank_account

      sig { params(bank_account: String).void }
      attr_writer :bank_account

      # Your business company number.
      sig { returns(T.nilable(String)) }
      attr_reader :company_number

      sig { params(company_number: String).void }
      attr_writer :company_number

      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # URL to your company logo (HTTPS only, .svg/.jpg/.png). Recommended 240px by
      # 60px.
      sig { returns(T.nilable(String)) }
      attr_reader :logo

      sig { params(logo: String).void }
      attr_writer :logo

      sig { returns(T.nilable(String)) }
      attr_reader :phone

      sig { params(phone: String).void }
      attr_writer :phone

      sig { returns(T.nilable(String)) }
      attr_reader :website

      sig { params(website: String).void }
      attr_writer :website

      sig do
        params(
          address: String,
          name: String,
          vat_number: String,
          bank_account: String,
          company_number: String,
          email: String,
          logo: String,
          phone: String,
          website: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Your business trading address.
        address:,
        # Your business trading name.
        name:,
        # Your business VAT number.
        vat_number:,
        bank_account: nil,
        # Your business company number.
        company_number: nil,
        email: nil,
        # URL to your company logo (HTTPS only, .svg/.jpg/.png). Recommended 240px by
        # 60px.
        logo: nil,
        phone: nil,
        website: nil
      )
      end

      sig do
        override.returns(
          {
            address: String,
            name: String,
            vat_number: String,
            bank_account: String,
            company_number: String,
            email: String,
            logo: String,
            phone: String,
            website: String
          }
        )
      end
      def to_hash
      end
    end
  end
end

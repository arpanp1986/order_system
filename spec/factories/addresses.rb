require 'faker'

FactoryBot.define do
  factory :address do
    customer { FactoryBot.create(:customer) }
    address_1 { Faker::Address.street_name}
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code.delete("-")}
    country { Faker::Address.country_code }
    address_type { AddressType.create(name: "shipping")}
  end
end

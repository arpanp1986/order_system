require 'faker'

FactoryBot.define do
  factory :address do
    user { FactoryBot.create(:user) }
    address_1 { Faker::Address.street_name}
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code.delete("-")}
    country { Faker::Address.country_code }
    address_type { AddressType.create(name: "shipping")}
  end
end

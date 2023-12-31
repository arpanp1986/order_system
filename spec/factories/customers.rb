require 'faker'

FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { "#{rand 100..900}-#{rand 100..900}-#{rand 1000..9999}" }
  end
end

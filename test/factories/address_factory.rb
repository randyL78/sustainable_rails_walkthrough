FactoryBot.define do
  factory :address do
    street_name { Faker::Address.street_address }
    zip { Faker::Address.zip }
  end
end

FactoryBot.define do
  factory :manufacturer do
    name { Faker::Company.unique.name }
    address
  end
end

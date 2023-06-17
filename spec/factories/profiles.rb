FactoryBot.define do
  factory :profile do
    shop { Faker::Company.name }
    prefecture_id { Faker::Number.between(from: 2, to: 49) }
    customer_id { Faker::Number.between(from: 2, to: 7) }
    price_id { Faker::Number.between(from: 2, to: 13) }
    country_id { Faker::Number.between(from: 2, to: 4) }
    introduction { Faker::Lorem.paragraph }
    association :user
  end
end

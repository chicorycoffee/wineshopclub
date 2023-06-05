FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    name { Faker::Lorem.sentence }
    importer { Faker::Company.name }
    genre_id { Faker::Number.between(from: 2, to: 4) }
    country_id { Faker::Number.between(from: 2, to: 11) }
    type_id { Faker::Number.between(from: 2, to: 7) }
    taste_id { Faker::Number.between(from: 2, to: 22) }
    grape_id { Faker::Number.between(from: 2, to: 13) }
    price_id { Faker::Number.between(from: 2, to: 13) }
    text { Faker::Lorem.paragraph }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_sample.png'), filename: 'test_sample.png')
    end
  end
end

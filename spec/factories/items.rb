FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    explanation {Faker::Lorem.paragraph}
    category_id {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    days_required_id {Faker::Number.between(from: 2, to: 4)}
    price { 300 }

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    association :user
  end
end
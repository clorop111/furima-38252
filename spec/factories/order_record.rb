
FactoryBot.define do
  factory :order_record do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)}
    prefecture_id { Faker::Number.between(from: 2, to:4)}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building_name {Faker::Address.street_name}
    phone_number {Faker::Number.decimal_part(digits: 11)}
    token {Faker::Internet.password(min_length:20, max_length:30)}
  end
end

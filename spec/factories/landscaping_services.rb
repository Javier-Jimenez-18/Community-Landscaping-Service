FactoryBot.define do
  factory :landscaping_service do
    landscape_service { Faker::Lorem.string }
    fee_per_hour { Faker::Number.decimal(digits: 4).to_i }
    date_time { Faker::Lorem.string }
    association :senior
    association :student
  end
end

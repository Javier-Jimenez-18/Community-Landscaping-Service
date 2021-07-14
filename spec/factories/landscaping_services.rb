FactoryBot.define do
  factory :landscaping_service do
    landscape_service { Faker::Lorem.sentence(word_count: 2) }
    fee_per_hour { Faker::Number.decimal(l_digits: 4).to_i }
    date_time { '2021-07-15 15:00:00' }
    association :senior
    association :student
  end
end

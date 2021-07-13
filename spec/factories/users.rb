require 'faker'
FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Lorem.string }
    f.reset_password_token { Faker::Lorem.string }
    f.reset_password_sent_at { Faker::Lorem.string }
    f.remember_created_at { Faker::Lorem.string }
  end
end

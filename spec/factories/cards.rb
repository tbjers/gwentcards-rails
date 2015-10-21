require 'faker'

FactoryGirl.define do
  factory :card do
    name { Faker::Lorem.sentence }
    obtain { Faker::Lorem.sentence }
    territory { Faker::Lorem.sentence }
    quest { Faker::Lorem.sentence }
    location { Faker::Lorem.sentence }
    starter { Faker::Number.between(0, 1) ? true : false }
  end
end

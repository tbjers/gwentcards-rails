require 'faker'

FactoryGirl.define do
  factory :faction do
    name { Faker::Lorem.sentence }
  end
end

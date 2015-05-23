# spec/factories/card_set_factory.rb
FactoryGirl.define do
  factory :card_set do
    name { Faker::Lorem.word }
  end
end

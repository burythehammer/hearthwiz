# spec/factories/card_set_factory.rb
FactoryGirl.define do
  factory :card_set, aliases: [:fake_card_set] do
    name { FFaker::Lorem.word }
  end
end

# spec/factories/rarity_factory.rb
FactoryGirl.define do
  factory :rarity do
    name { Faker::Lorem.word }
    colour { Faker::Lorem.word }
    hexcolour { '#' + Faker::Number.number(6) }
    craft_cost { Faker::Number.number(3) }
    disenchant_reward { Faker::Number.number(3) }
  end
end
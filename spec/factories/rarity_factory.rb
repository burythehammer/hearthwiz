# spec/factories/rarity_factory.rb

require 'ffaker'

FactoryGirl.define do
  factory :rarity, aliases: [:fake_rarity] do
    name { FFaker::Lorem.word }
    colour { FFaker::Lorem.word }
    hexcolour { '#' + Faker::Number.number(6) }
    craft_cost { Faker::Number.number(3) }
    disenchant_reward { Faker::Number.number(3) }
  end
end

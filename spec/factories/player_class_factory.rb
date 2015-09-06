# spec/factories/player_class_factory.rb

require 'ffaker'

FactoryGirl.define do
  factory :player_class, aliases: [:fake_player_class] do
    name { FFaker::Lorem.word }
    colour { FFaker::Lorem.word }
    hexcolour { '#' + Faker::Number.number(6) }
    hero { FFaker::Name.name }
  end
end

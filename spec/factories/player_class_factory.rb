# spec/factories/player_class_factory.rb
FactoryGirl.define do
  factory :player_class, aliases: [:fake_player_class] do
    name { Faker::Lorem.word }
    colour { Faker::Lorem.word }
    hexcolour { '#' + Faker::Number.number(6) }
    hero { Faker::Name.name }
  end
end

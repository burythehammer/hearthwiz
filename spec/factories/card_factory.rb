# spec/factories/card_factory.rb

require 'ffaker'

FactoryGirl.define do
  factory :card do
    name { FFaker::Name.name }
    json_id { 'TST' + Faker::Number.number(3) }
    cost { rand(10) }

    # pulls from other factories
    rarity
    card_set
    player_class

    # default trait is minion
    card_type 'Minion'
    attack { rand(10) }
    health { rand(10) }
    durability nil
    race %w(Beast Demon Dragon Mech Murloc Pirate Totem).sample
    elite [true, false].sample

    trait :minion do
      card_type 'Minion'
      attack { rand(10) }
      health { rand(10) }
      durability nil
      race %w(Beast Demon Dragon Mech Murloc Pirate Totem).sample
    end

    trait :spell do
      card_type 'Spell'
      attack nil
      health nil
      durability nil
      race nil
      elite nil
    end

    trait :weapon do
      card_type 'Weapon'
      attack { rand(10) }
      health nil
      durability { rand(10) }
      race nil
      elite nil
    end

    text { FFaker::Lorem.sentence }
    flavour { FFaker::Lorem.sentence }
    artist { FFaker::Lorem.sentence }

    how_to_get_gold { FFaker::Lorem.sentence }
    collectible [true, false].sample
    faction ['Alliance', 'Horde', nil].sample
  end
end

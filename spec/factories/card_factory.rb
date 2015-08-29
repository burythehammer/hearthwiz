# spec/factories/card_factory.rb

FactoryGirl.define do
  factory :card do
    name { Faker::Name.name }
    json_id { 'TST' + Faker::Number.number(3) }
    cost { Faker::Number.digit }

    # pulls from other factories
    rarity
    card_set
    player_class

    trait :minion do
      card_type 'Minion'
      attack { Faker::Number.digit }
      health { Faker::Number.digit }
      durability nil
      race %w(Beast Demon Dragon Mech Murloc Pirate Totem).sample
      elite [true, false].sample
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
      attack { Faker::Number.digit }
      health nil
      durability { Faker::Number.digit }
      race nil
      elite nil
    end

    text { Faker::Lorem.sentence }
    flavour { Faker::Lorem.sentence }
    artist { Faker::Lorem.sentence }

    how_to_get_gold { Faker::Lorem.sentence }
    collectible [true, false].sample
    elite [true, false].sample
    faction ['Alliance', 'Horde', nil].sample
  end
end

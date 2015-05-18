# spec/factories/contacts.rb
FactoryGirl.define do
  factory :minion_card, class: Card do |c|
    c.name { Faker::Name.name }

    c.cost { Faker::Number.digit }
    c.card_type 'Minion'

    c.rarity_id Rarity.order('RANDOM()').first.id
    c.card_set_id CardSet.order('RANDOM()').first.id
    c.faction ['Alliance', 'Horde', nil].sample

    c.attack { Faker::Number.digit }
    c.health { Faker::Number.digit }
    c.durability nil

    c.text { Faker::Lorem.sentence }
    c.flavour { Faker::Lorem.sentence }
    c.artist { Faker::Lorem.sentence }

    c.json_id { 'TST' + Faker::Number.number(3) }
    c.how_to_get_gold { Faker::Lorem.sentence }
    c.race ['Beast', 'Demon', 'Dragon', 'Mech', 'Murloc', 'Pirate', 'Totem', nil].sample
    c.collectible [true, false].sample
    c.elite [true, false].sample

    c.player_class_id PlayerClass.order('RANDOM()').first.id
  end

  factory :weapon_card, class: Card do |c|
    c.name { Faker::Lorem.word }

    c.cost { Faker::Number.digit }

    c.card_type 'Weapon'
    c.rarity_id Rarity.order('RANDOM()').first.id

    c.card_set_id CardSet.order('RANDOM()').first.id
    c.faction nil

    c.attack { Faker::Number.digit }
    c.health nil
    c.durability { Faker::Number.digit }

    c.text { Faker::Lorem.sentence }
    c.flavour { Faker::Lorem.sentence }
    c.artist { Faker::Lorem.sentence }

    c.json_id { 'TST' + Faker::Number.number(3) }
    c.how_to_get_gold { Faker::Lorem.sentence }
    c.race nil
    c.collectible [true, false].sample

    c.player_class_id PlayerClass.order('RANDOM()').first.id
  end

  factory :spell_card, class: Card do |c|
    c.name { Faker::Lorem.word }

    c.cost { Faker::Number.digit }

    c.card_type 'Spell'
    c.rarity_id Rarity.order('RANDOM()').first.id

    c.card_set_id CardSet.order('RANDOM()').first.id
    c.faction nil

    c.attack nil
    c.health nil
    c.durability nil

    c.text { Faker::Lorem.sentence }
    c.flavour { Faker::Lorem.sentence }
    c.artist { Faker::Lorem.sentence }

    c.json_id { 'TST' + Faker::Number.number(3) }
    c.how_to_get_gold { Faker::Lorem.sentence }
    c.race nil
    c.collectible [true, false].sample

    c.player_class_id PlayerClass.order('RANDOM()').first.id
  end
end

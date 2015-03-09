# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

begin
  # start off entire run with with a full truncation
  #  DatabaseCleaner.clean_with :truncation, {:except => %w[plans]}
  DatabaseCleaner.clean_with :truncation
  # continue with the :transaction strategy to be faster while running tests.
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

#old fashioned way of doing things
=begin

card_list = [
  [ "Abusive Sergeant", 1, "Common" ],
  [ "Acidic Swamp Ooze", 2, "Basic" ],
  [ "Leeroy Jenkins", 5, "Legendary" ],
  [ "Faceless Manipulator", 5, "Epic" ],
  [ "Abomination", 5, "Rare" ]
]

card_list.each do |name, cost, rarity|
  Card.create( name: name, cost: cost, rarity: rarity )
end

=end

rarity_list = [
  ["Basic", "None", "#000000"],
  ["Common", "White", "#000000"],
  ["Rare", "Blue", "#0000FF"],
  ["Epic", "Purple", "#990099"],
  ["Legendary","Orange", "#FF9900"]
]

rarity_list.each do |name, colour, hexcolour|
  Rarity.create( name: name, colour: colour, hexcolour: hexcolour )
end

Card.create( 
  name: "Abusive Sergeant", 
  cost: 1, 
  rarity_id: Rarity.find_by(name: "Common").id)

Card.create( 
  name: "Acidic Swamp Ooze", 
  cost: 2, 
  rarity_id: Rarity.find_by(name: "Basic").id)

Card.create( 
  name: "Leeroy Jenkins", 
  cost: 5, 
  rarity_id: Rarity.find_by(name: "Legendary").id)

Card.create( 
  name: "Faceless Manipulator", 
  cost: 5, 
  rarity_id: Rarity.find_by(name: "Epic").id)

Card.create( 
  name: "Abomination", 
  cost: 5, 
  rarity_id: Rarity.find_by(name: "Rare").id)
  




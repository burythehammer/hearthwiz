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


def create_card_from_json_hash(card_hash)

  puts card_hash["name"]

  Card.create(name: card_hash["name"],
    card_type: card_hash["type"],
    faction: card_hash["faction"],
    rarity_id: Rarity.find_by(name: card_hash["rarity"]).id,
    cost: card_hash["cost"],
    attack: card_hash["attack"],
    health: card_hash["health"],
    text: card_hash["text"],
    flavour: card_hash["flavor"],
    artist: card_hash["artist"],
    collectible: card_hash["collectible"],
    json_id: card_hash["id"],
    how_to_get_gold: card_hash["howToGetGold"])

end

# seeds rarities from user defined list

rarity_list = Array.new

rarity_list << [name: "Free",      colour: "None",   hexcolour: "#000000"]
rarity_list << [name: "Basic",     colour: "None",   hexcolour: "#000000"]
rarity_list << [name: "Common",    colour: "Green",  hexcolour: "#1eff00"]
rarity_list << [name: "Rare",      colour: "Blue",   hexcolour: "#0070dd"]
rarity_list << [name: "Epic",      colour: "Purple", hexcolour: "#a335ee"]
rarity_list << [name: "Legendary", colour: "Orange", hexcolour: "#ff8000"]

rarity_list.each do |rarity|
  Rarity.create(rarity)
end

# seeds cards from json file

filepath = File.join(Rails.root, 'db', 'json', 'AllSets.json')
fileContents = File.open(filepath).read
card_sets = JSON.parse(fileContents)


card_sets_wanted = ["Basic","Classic","Curse of Naxxramas", "Goblins vs Gnomes", "Promotion", "Reward"]


card_sets_wanted.each do |card_set|

  puts "--------CREATING #{card_set} CARDS-----------"

  card_sets["#{card_set}"].each do |c|  
    next if c["rarity"].nil? #skips if rarity is nil. Bit of a fudge but will do for now
    create_card_from_json_hash c
  end
end

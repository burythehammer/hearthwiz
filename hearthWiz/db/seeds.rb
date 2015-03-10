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


def create_card_from_json_hash(c)

  card = Card.new
  card[:name] = c["name"]
  card[:card_type] = c["type"]
  card[:faction] = c["faction"]
  card[:rarity_id] = Rarity.find_by(name: c["rarity"]).id
  card[:cost] = c["cost"]
  card[:attack] = c["attack"]
  card[:health] = c["health"]
  card[:text] = c["text"]
  card[:flavour] = c["flavor"]
  card[:artist] = c["artist"]
  card[:collectible] = c["collectible"]
  card[:json_id] = c["id"]
  card[:how_to_get_gold] = c["howToGetGold"]

  card.save!


=begin
  Card.create(name: c["name"], 
    card_type: c["type"],
    faction: c["faction"],
    rarity_id: Rarity.find_by(name: c["rarity"]).id,
    cost: c["cost"],
    attack: c["attack"],
    health: c["health"],
    text: c["text"],
    flavour: c["flavor"],
    artist: c["artist"],
    collectible: c["collectible"],
    json_id: c["id"],
    how_to_get_gold: c["howToGetGold"])
=end

end

# seeds rarities from user defined list

rarity_list = Array.new

rarity_list << [name: "Free",      colour: "None",   hexcolour: "#000000"]
rarity_list << [name: "Basic",     colour: "None",   hexcolour: "#000000"]
rarity_list << [name: "Common",    colour: "Green",  hexcolour: "#1eff00", craft_cost: 40,    disenchant_reward: 5]
rarity_list << [name: "Rare",      colour: "Blue",   hexcolour: "#0070dd", craft_cost: 100,   disenchant_reward: 20]
rarity_list << [name: "Epic",      colour: "Purple", hexcolour: "#a335ee", craft_cost: 400,   disenchant_reward: 100]
rarity_list << [name: "Legendary", colour: "Orange", hexcolour: "#ff8000", craft_cost: 1600,  disenchant_reward: 400]

rarity_list.each do |rarity|
  Rarity.create(rarity)
end

# seeds cards from json file

filepath = File.join(Rails.root, 'db', 'json', 'AllSets.enGB.json')
fileContents = File.open(filepath).read
card_sets = JSON.parse(fileContents)


card_sets_wanted = ["Basic","Classic","Curse of Naxxramas", "Goblins vs Gnomes", "Promotion", "Reward"]


card_sets_wanted.each do |card_set|

  puts "--------CREATING #{card_set} CARDS-----------"

  card_sets["#{card_set}"].each do |c|

    begin  
      next if c["rarity"].nil? #skips if rarity is nil. Bit of a fudge but will do for now
      create_card_from_json_hash c
      puts c["name"]
    rescue ActiveRecord::RecordInvalid
      puts "could not create record #{c["name"]}"
    end

  end


end

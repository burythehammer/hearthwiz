# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

begin
  # start off entire run with with a full truncation
  #  DatabaseCleaner.clean_with :truncation, {:except => %w[plans]}
  DatabaseCleaner.clean_with :truncation
  # continue with the :transaction strategy to be faster while running tests.
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end


#helper method to create a card from the json
def create_card_from_json_hash(c)
  card = Card.new


  card[:name] = c["name"]
  card[:card_type] = c["type"]

  begin
    card[:rarity_id] = Rarity.find_by(name: c["rarity"]).id
  rescue NoMethodError
    card[:rarity_id] = Rarity.find_by(name: "Common").id
  end

  card[:faction] = c["faction"]
  card[:cost] = c["cost"]
  card[:durability] = c["durability"]
  card[:attack] = c["attack"]
  card[:health] = c["health"]
  card[:text] = c["text"]
  card[:flavour] = c["flavor"]
  card[:artist] = c["artist"]
  card[:collectible] = c["collectible"]
  card[:json_id] = c["id"]
  card[:how_to_get_gold] = c["howToGetGold"]
  card.save!
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


# card sets we want to add
card_sets_wanted = ["Basic","Classic","Curse of Naxxramas", "Goblins vs Gnomes", "Promotion", "Reward"]


# iterates over first card sets, then over each card in that set
card_sets_wanted.each do |card_set|

  puts "--------CREATING #{card_set} CARDS-----------"

  card_sets["#{card_set}"].each do |c|

    begin  
      create_card_from_json_hash(c)
      puts "." 
    rescue ActiveRecord::RecordInvalid
      puts "could not create card: #{c["name"]}"
    end

  end


end

# seeds all cards
def seed_cards

  card_sets = parse_cards_json

  # card sets we want to add
  card_sets_wanted = ["Basic","Classic","Curse of Naxxramas", "Goblins vs Gnomes", "Promotion", "Reward"]

  # iterates over card sets, then over each card in that set
  card_sets_wanted.each do |card_set|

    print "\n" + "#{card_set} cards" + "\n" 

    card_sets["#{card_set}"].each do |c|

      begin  
        create_card_from_json_hash(c)
        print "." 
      rescue ActiveRecord::RecordInvalid
        print "\n" + "could not create card: #{c["name"]}" + "\n" 
      end

    end

    print "\n"

  end
end


# create a card from the json hash
def create_card_from_json_hash(c)

	card = Card.new
	
	card[:name] = c["name"]
	card[:card_type] = c["type"]

	# raises an error if the rarity is not supplied - catches this and assumes the card is 'common'
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





# parses cards from json file, returns hash
def parse_cards_json
  filepath = File.join(Rails.root, 'db', 'json', 'AllSets.enGB.json')
  fileContents = File.open(filepath).read
  card_sets = JSON.parse(fileContents)
  return card_sets
end
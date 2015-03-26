
# takes an array of the card sets wanted to be parsed
def seed_cards(card_sets_wanted)

  card_sets = parse_cards_json

  # iterates over card sets, then over each card in that set
  card_sets_wanted.each do |card_set|

    print "\n" + "#{card_set} cards: total #{card_sets[card_set].size}" + "\n" 

    card_sets["#{card_set}"].each do |c|

    card = Card.new

    c["card_set"] = card_set

      begin  
        card = create_card_from_json_hash(c)
        printCardSeed(card.getRarityColour)
      rescue ActiveRecord::RecordInvalid
        puts "did not create card: #{c["name"]}" + "\n"
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
	card[:card_set_id] = CardSet.find_by(name: c["card_set"]).id
	card[:faction] = c["faction"]
	card[:cost] = c["cost"]
	card[:durability] = c["durability"]
	card[:attack] = c["attack"]
	card[:health] = c["health"]
	card[:text] = ActionView::Base.full_sanitizer.sanitize(c["text"])
	card[:flavour] = ActionView::Base.full_sanitizer.sanitize(c["flavor"])
	card[:artist] = c["artist"]
	card[:json_id] = c["id"]
	card[:how_to_get_gold] = c["howToGetGold"]

	# could use ternary but this is more readable
	c["collectible"] = false if c["collectible"].nil? 

	card[:collectible] = c["collectible"]

	# sometimes rarity is not supplied - rescues this and supplies 'common' default
	begin
		card[:rarity_id] = Rarity.find_by(name: c["rarity"]).id
	rescue NoMethodError
		card[:rarity_id] = Rarity.find_by(name: "Common").id
	end

	# sometimes player class not supplied, rescues and supplies 'neutral' default
	begin
		card[:player_class_id] = PlayerClass.find_by(name: c["playerClass"]).id
	rescue NoMethodError
		card[:player_class_id] = PlayerClass.find_by(name: "Neutral").id
	end


	if !card.valid?
        card.errors.each do |key, value|
			puts c["name"]
			puts "#{key} not valid, error: #{value}" 
		end
	end

	card.save!
	return card
end

# parses cards from json file, returns hash
def parse_cards_json
  filepath = File.join(Rails.root, 'db', 'json', 'AllSets.enGB.json')
  fileContents = File.open(filepath).read
  card_sets = JSON.parse(fileContents)
  return card_sets
end

def printCardSeed(colour)
    print "C".colorize(:color => :white) if colour == "White" 
	print "R".colorize(:color => :blue) if colour == "Blue" 
	print "E".colorize(:color => :purple) if colour == "Purple" 
	print "L".colorize(:color => :orange) if colour == "Orange" 
end


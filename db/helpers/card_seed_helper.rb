# takes an array of the card sets wanted to be parsed
def seed_cards(card_sets_wanted)
  card_sets = parse_cards_json

  # iterates over card sets, then over each card in that set
  card_sets_wanted.each do |card_set|
    card_sets["#{card_set}"].each do |c|
      c['card_set'] = card_set
      create_card_from_json_hash(c)
    end
  end
end

# create a card from the json hash
def create_card_from_json_hash(c)
  card = Card.set_card_details(Card.new, c)
  card.save!
  card
end

# parses cards from json file, returns hash
def parse_cards_json
  filepath = File.join(Rails.root, 'db', 'json', 'AllSets.enUS.json')
  file_contents = File.open(filepath).read
  JSON.parse(file_contents)
end



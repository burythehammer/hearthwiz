# takes an array of the card sets wanted to be parsed
def seed_cards(card_sets_wanted)
  card_sets = parse_cards_json

  card_sets_wanted.each do |card_set|
    card_sets["#{card_set}"].each do |c|
      card = Card.new
      c['card_set'] = card_set
      card.set_details_from_hash(c)
      card.save!
    end
  end
end



# parses cards from json file, returns hash
def parse_cards_json
  file_path = File.join(Rails.root, 'db', 'json', 'AllSets.enUS.json')
  file_contents = File.open(file_path).read
  JSON.parse(file_contents)
end
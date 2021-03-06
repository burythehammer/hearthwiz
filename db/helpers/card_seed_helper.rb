
# takes an array of the card sets wanted to be parsed
def seed_cards(card_sets_wanted)
  card_sets = parse_cards_json

  # iterates over card sets, then over each card in that set
  card_sets_wanted.each do |card_set|
    card_sets["#{card_set}"].each do |c|
      c['card_set'] = card_set
      create_card_from_hash(c)
    end
  end
end

# create a card from the json hash
def create_card_from_hash(c)
  card = set_card_details(Card.new, c)
  card.save!
  card
end

# parses cards from json file, returns hash
def parse_cards_json
  filepath = File.join(Rails.root, 'db', 'json', 'AllSets.enUS.json')
  file_contents = File.open(filepath).read
  JSON.parse(file_contents)
end

def set_card_details(card, c)
  card.name = c['name']
  card.card_type = c['type']
  card.faction = c['faction']
  card.cost = c['cost']
  card.durability = c['durability']
  card.attack = c['attack']
  card.health = c['health']
  card.text = c['text']
  card.flavour = c['flavor']
  card.artist = c['artist']
  card.json_id = c['id']
  card.how_to_get_gold = c['howToGetGold']
  card.race = c['race']
  card.card_set_id = card_set_id(c)
  card.rarity_id = rarity_id(c)
  card.collectible = card_collectibility(c)
  card.player_class_id = player_class_id(c)
  card
end

# HELPER METHODS - these set the various fields

def card_set_id(c)
  CardSet.find_by(name: c['card_set']).id
end

# TODO: improve this with database default
def rarity_id(c)
  Rarity.find_by(name: c['rarity']).id
rescue NoMethodError
  Rarity.find_by(name: 'Common').id
end

# TODO: improve this with database default
def player_class_id(c)
  PlayerClass.find_by(name: c['playerClass']).id
rescue NoMethodError
  PlayerClass.find_by(name: 'Neutral').id
end

def card_collectibility(c)
  !c['collectible'].nil?
end

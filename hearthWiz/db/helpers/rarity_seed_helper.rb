# seeds rarities from user defined list
def seed_rarities

  rarity_list = Array.new

  rarity_list << [name: "Free",      colour: "None",   hexcolour: "#000000"]
  rarity_list << [name: "Basic",     colour: "None",   hexcolour: "#000000"]
  rarity_list << [name: "Common",    colour: "White",  hexcolour: "#000000", craft_cost: 40,    disenchant_reward: 5]
  rarity_list << [name: "Rare",      colour: "Blue",   hexcolour: "#0070dd", craft_cost: 100,   disenchant_reward: 20]
  rarity_list << [name: "Epic",      colour: "Purple", hexcolour: "#a335ee", craft_cost: 400,   disenchant_reward: 100]
  rarity_list << [name: "Legendary", colour: "Orange", hexcolour: "#ff8000", craft_cost: 1600,  disenchant_reward: 400]

  rarity_list.each do |rarity|
    Rarity.create(rarity)
  end
end

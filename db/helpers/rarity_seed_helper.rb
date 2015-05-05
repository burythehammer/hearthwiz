# seeds rarities from user defined list
def seed_rarities
  Rarity.create(free)
  Rarity.create(basic)
  Rarity.create(common)
  Rarity.create(rare)
  Rarity.create(epic)
  Rarity.create(legendary)
end

def free
  [name: 'Free',
   colour: 'None',
   hexcolour: '#000000']
end

def basic
  [name: 'Basic',
   colour: 'None',
   hexcolour: '#000000']
end

def common
  [name: 'Common',
   colour: 'White',
   hexcolour: '#000000',
   craft_cost: 40,
   disenchant_reward: 5]
end

def rare
  [name: 'Rare',
   colour: 'Blue',
   hexcolour: '#0070dd',
   craft_cost: 100,
   disenchant_reward: 20]
end

def epic
  [name: 'Epic',
   colour: 'Purple',
   hexcolour: '#a335ee',
   craft_cost: 400,
   disenchant_reward: 100]
end

def legendary
  [name: 'Legendary',
   colour: 'Orange',
   hexcolour: '#ff8000',
   craft_cost: 1600,
   disenchant_reward: 400]
end

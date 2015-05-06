# seeds rarities from user defined list
def seed_classes
  PlayerClass.create(neutral)
  PlayerClass.create(druid)
  PlayerClass.create(hunter)
  PlayerClass.create(mage)
  PlayerClass.create(paladin)
  PlayerClass.create(priest)
  PlayerClass.create(rogue)
  PlayerClass.create(shaman)
  PlayerClass.create(warlock)
  PlayerClass.create(warrior)
end

def neutral
  [name: 'Neutral']
end

def druid
  [name: 'Druid',
   hero: 'Malfurion Stormrage',
   colour: 'Orange',
   hexcolour: '#FF7D0A']
end

def hunter
  [name: 'Hunter',
   hero: 'Rexxar',
   colour: 'Green',
   hexcolour: '#ABD473']
end

def mage
  [name: 'Mage',
   hero: 'Jaina Proudmoore',
   colour: 'Light blue',
   hexcolour: '#69CCF0']
end

def paladin
  [name: 'Paladin',
   hero: 'Uther Lightbringer',
   colour: 'Pink',
   hexcolour: '#F58CBA']
end

def priest
  [name: 'Priest',
   hero: 'Anduin Wrynn',
   colour: 'White',
   hexcolour: '#FFFFFF']
end

def rogue
  [name: 'Rogue',
   hero: 'Valeera Sanguinar',
   colour: 'Light yellow',
   hexcolour: '#FFF569']
end

def shaman
  [name: 'Shaman',
   hero: 'Thrall',
   colour: 'Blue',
   hexcolour: '#0070DE']
end

def warlock
  [name: 'Warlock',
   hero: "Gul'dan",
   colour: 'Purple',
   hexcolour: '#9482C9']
end

def warrior
  [name: 'Warrior',
   hero: 'Garrosh Hellscream',
   colour: 'Tan',
   hexcolour: '#C79C6E']
end

class Card < ActiveRecord::Base

  self.primary_key = :json_id

  belongs_to :rarity, :class_name => "Rarity", :foreign_key => "rarity_id"
  validates_associated :rarity
  validates :rarity, presence: true

  belongs_to :player_class, :class_name => "PlayerClass", :foreign_key => "player_class_id"
  validates_associated :player_class
  validates :player_class, presence: true

  belongs_to :card_set, :class_name => "CardSet", :foreign_key => "card_card_id"
  validates_associated :card_set

  #	validates :mechanics
  #	validates :flavour
  #	validates :artist
  #	validates :how_to_get_gold

  validates :json_id,
    presence: true,
    uniqueness: true

  validates :name,
    presence: true

  validates :card_type,
    presence: true,
    :inclusion => { in: ["Minion", "Spell", "Weapon", "Enchantment", "Hero", "Hero Power"] }

  validates :rarity_id,
    presence: true,
    :numericality => { only_integer: true }

  validates :player_class_id,
    presence: true,
    :numericality => { only_integer: true }

  validates :collectible,
    :inclusion => { in: [true, false]}

  validates :card_set_id,
    presence: true,
    :numericality => { only_integer: true }


  case :card_type

  when "Weapon"
    validates :durability, :cost,
      presence: true,
      :numericality => { only_integer: true, greater_than_or_equal_to: 0 }

  when "Minion"
    validates :health, :attack, :cost,
      presence: true,
      :numericality => { only_integer: true, greater_than_or_equal_to: 0 }
    validates :elite,
      presence: true,
      :inclusion => {in: [true, false]}

  when "Spell"
    validates :cost,
      presence: true,
      :numericality => { only_integer: true, greater_than_or_equal_to: 0 }


  when "Enchantment"
    validates :collectible,
      presence: true,
      :inclusion => {in: [false]}

  end


  validates :faction,
    :inclusion => { in: ["Horde","Alliance","Neutral"] },
    allow_nil: true


  # QUERIES #

  def collectible?
    return :collectible
  end

  def weapon?
    return self.card_type == "Weapon"
  end

  def minion?
    return self.card_type == "Minion"
  end

  def spell?
    return self.card_type == "Spell"
  end

  def disenchantable?
    return !self.getDisenchantValue.nil?
  end

  def craftable?
    return !self.getCraftCost.nil?
  end

  def faction?
    return !self.faction.nil?
  end

  # GETTERS #

  def getRarity
    return Rarity.find(self.rarity_id)
  end

  def getRarityName
    return self.getRarity.name
  end

  def getClass
    return PlayerClass.find(self.player_class).name
  end

  def getRarityColour
    return self.getRarity.colour
  end

  def getRarityHexColour
    return self.getRarity.hexcolour
  end

  def getCardSet
    return CardSet.find(self.card_set_id)
  end

  def getCardSetName
    return self.getCardSet.name
  end

  def getDisenchantValue
    return self.getRarity.disenchant_reward
  end

  def getCraftCost
    return self.getRarity.craft_cost
  end

  def getPath
    return "cards/id/" + self.json_id
  end

  def getNamePath
    return "cards/name/" + self.name
  end

  def getURL
    return getIdPath 
  end

  def getShortDescription
    return getRarityName + " " + getClass + " " + self.card_type
  end


  def getCardQuickInfo
    quickInfo = Hash.new

    quickInfo[:cost] = self[:cost]
    quickInfo[:health] = self[:health] if minion?
    quickInfo[:attack] = self[:attack] if minion?
    quickInfo[:rarity] = self.getRarityName
    quickInfo[:disenchant] = self.getDisenchantValue if disenchantable?
    quickInfo[:craft] = self.getCraftCost if craftable?
    quickInfo[:durability] = self.durability if weapon?
  end

end

class Card < ActiveRecord::Base

	belongs_to :rarities
	validates_associated :rarities

	belongs_to :player_classes
	validates_associated :player_classes


	validates :name, 
		presence: true

=begin
	validates :cost, 
		presence: true,
		:numericality => { :only_integer => true }
=end


	validates :card_type,
		presence: true,
		:inclusion => { :in => ["Minion", "Spell", "Weapon", "Enchantment", "Hero", "Hero Power"] }

	validates :rarity_id,
		presence: true,
		:numericality => { :only_integer => true }


=begin
	validates :faction,
	:inclusion => { :in => ["Alliance", "Horde", "Neutral"] }
=end


#	validates :text

#	validates :mechanics

#	validates :flavour

#	validates :artist

=begin
	validates :attack,
	:numericality => { :only_integer => true }

	validates :health,
	:numericality => { :only_integer => true }

	validates :collectible,
	:inclusion => {:in => [true, false]}

	validates :json_id,
	presence: true,
	uniqueness: true

	validates :elite,
	:inclusion => {:in => [true, false]}

	validates :durability,
	:numericality => { :only_integer => true }
=end


#	validates :how_to_get_gold

  	def weapon?
  	    return :card_type == "Weapon"
    end

    def minion?
  	    return :card_type == "Minion"
    end

    def disenchantable?
		return !self.getDisenchantValue.nil?
    end

    def craftable?
    	return !self.getCraftCost.nil?
    end

	def getRarity
		return Rarity.find(self.rarity_id)
	end

    def getRarityName
      	return self.getRarity.name
    end

    def getRarityColour
    	return self.getRarity.colour
    end

    def getRarityHexColour
    	return self.getRarity.hexcolour
    end

    def getDisenchantValue
    	return self.getRarity.disenchant_reward
    end

	def getCraftCost
    	return self.getRarity.craft_cost
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
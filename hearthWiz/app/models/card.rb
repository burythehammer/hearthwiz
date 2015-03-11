class Card < ActiveRecord::Base

	self.primary_key = :json_id

	belongs_to :rarity, :class_name => "Rarity", :foreign_key => "rarity_id"
	validates_associated :rarity

	belongs_to :player_classes, :class_name => "PlayerClass", :foreign_key => "player_class_id"
	validates_associated :player_classes



=begin
		

		validates :faction,
			:inclusion => { :in =>  }

	#	validates :text

	#	validates :mechanics

	#	validates :flavour

	#	validates :artist

	#	validates :how_to_get_gold

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

	validates :name, 
		presence: true

	validates :card_type,
		presence: true,
		:inclusion => { :in => ["Minion", "Spell", "Weapon", "Enchantment", "Hero", "Hero Power"] }

	validates :rarity_id,
		presence: true,
		:numericality => { :only_integer => true }

	validates :collectible,
		presence: true,
		:inclusion => { :in => [true, false]}

	validate :playable_cards_cannot_have_nil_costs,
		:mana_cost_cannot_be_negative,
		:faction_is_alliance_horde_neutral




	# COST ASSERTIONS #

	def playable_cards_cannot_have_nil_costs
		if collectible? && self.cost.nil?
			errors.add(:cost, "cannot be nil!")
		end
	end

	def mana_cost_cannot_be_negative
		if collectible? && !self.cost.nil? && self.cost < 0
			errors.add(:cost, "cannot be negative!")
			print "error"
		end
	end

	# FACTION ASSERTIONS #
	
	def faction_is_alliance_horde_neutral

		if self.faction? && !["Alliance", "Horde", "Neutral"].include?(self.faction)
			errors.add(:faction, "can only be Alliance, Horde or Neutral!")
	
		end
	end


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

    def getIdPath
    	return "cards/id/" + self.json_id
    end

    def getNamePath
    	return "cards/name/" + self.name
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
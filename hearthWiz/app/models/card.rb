class Card < ActiveRecord::Base

=begin

	validates :name, 
		presence: true
	
	validates :cost, 
		presence: true,
		:numericality => { :only_integer => true }

	validates :card_type,
		presence: true
#		:inclusion => { :in => ["Minion", "Spell", "Weapon", "Enchantment"] }


	validates :rarity_id,
		presence: true,
		:numericality => { :only_integer => true }
	
	validates :faction,
	:inclusion => { :in => ["Alliance", "Horde", "Neutral"] }


	validates :text

	validates :mechanics

	validates :flavour

	validates :artist

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

#	validates :how_to_get_gold

=end

end
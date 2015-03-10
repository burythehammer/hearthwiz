class Card < ActiveRecord::Base

	belongs_to :rarities
	validates_associated :rarities


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


end
class Rarity < ActiveRecord::Base

	has_many :cards
	validates :name, presence: true
	validates :colour, presence: true

end

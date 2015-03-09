class Rarity < ActiveRecord::Base


	validates :name, presence: true
	validates :colour, presence: true

end

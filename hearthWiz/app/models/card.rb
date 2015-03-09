class Card < ActiveRecord::Base

	validates :name, 
		presence: true
	
	validates :cost, 
		presence: true

	validates :card_type,
		presence: true

end
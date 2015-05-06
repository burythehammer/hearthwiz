# Card rarity model.
# Used mainly through cards which reference this table
class Rarity < ActiveRecord::Base
  has_many :cards
  validates :name, presence: true
  validates :colour, presence: true
end

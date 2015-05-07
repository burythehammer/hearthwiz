# Card rarity model.
# Used mainly through cards which reference this table
class Rarity < ActiveRecord::Base
  has_many :cards
  validates :name, presence: true
  validates :colour, presence: true
  validates :hexcolour,
            presence: true
  validates_format_of :hexcolour, with: /\A(#[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/
  validates :craft_cost,
            numericality: { only_integer: true }
  validates :disenchant_reward, numericality: { only_integer: true }
end

# Card Set model.
# Represents a distinct set of cards.
# e.g. "Goblins vs Gnomes"
# Blizzard release different sets periodically with expansions and adventures.

class CardSet < ActiveRecord::Base
  has_many :cards
  validates :name, presence: true, uniqueness: true
end

# Card model.
# Represents an instance of a card and its associated data.
class Card < ActiveRecord::Base
  self.primary_key = :json_id
  belongs_to :rarity, class_name: 'Rarity', foreign_key: 'rarity_id'
  validates_associated :rarity
  validates :rarity, presence: true
  belongs_to :player_class,
             class_name: 'PlayerClass',
             foreign_key: 'player_class_id'
  validates_associated :player_class
  validates :player_class, presence: true
  belongs_to :card_set, class_name: 'CardSet', foreign_key: 'card_card_id'
  validates_associated :card_set
  validates :json_id,
            presence: true,
            uniqueness: true
  validates :name,
            presence: true
  validates :card_type,
            presence: true,
            inclusion: { in: ['Minion',
                              'Spell',
                              'Weapon',
                              'Enchantment',
                              'Hero',
                              'Hero Power'] }
  validates :rarity_id,
            presence: true,
            numericality: { only_integer: true }
  validates :player_class_id,
            presence: true,
            numericality: { only_integer: true }
  validates :collectible,
            inclusion: { in: [true, false] }
  validates :card_set_id,
            presence: true,
            numericality: { only_integer: true }
  case :card_type
  when 'Weapon'
    validates :durability, :cost,
              presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  when 'Minion'
    validates :health, :attack, :cost,
              presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :elite,
              presence: true,
              inclusion: { in: [true, false] }
  when 'Spell'
    validates :cost,
              presence: true,
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0 }
  when 'Enchantment'
    validates :collectible,
              presence: true,
              inclusion: { in: [false] }
  end
  validates :faction,
            inclusion: { in: %w(Horde Alliance Neutral) },
            allow_nil: true

  def collectible?
    :collectible
  end

  def weapon?
    card_type == 'Weapon'
  end

  def minion?
    card_type == 'Minion'
  end

  def spell?
    card_type == 'Spell'
  end

  def disenchantable?
    !disenchant_value.nil?
  end

  def craftable?
    !craft_cost.nil?
  end

  def faction?
    !faction.nil?
  end

  # GETTERS #
  delegate :name, :colour, :colour, to: :rarity, prefix: true
  delegate :disenchant_value, :craft_cost, to: :rarity, prefix: false
  delegate :name, to: :card_set, prefix: true
  alias_attribute :mana, :cost

  def rarity
    Rarity.find(rarity_id)
  end

  def player_class_name
    PlayerClass.find(player_class.id).name
  end

  def card_set
    CardSet.find(card_set_id)
  end

  def path
    'cards/id/' + json_id
  end

  def name_path
    'cards/name/' + name
  end

  def short_description
    rarity_name + ' ' + player_class_name + ' ' + card_type
  end
end

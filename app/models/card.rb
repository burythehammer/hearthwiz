# Card model.
# Represents an instance of a card and its associated data.
class Card < ActiveRecord::Base
  self.primary_key = :json_id
  default_scope { includes(:rarity, :player_class).order('cost').where(collectible: true).where.not(cost: nil) }

  belongs_to :rarity,
             class_name: 'Rarity',
             foreign_key: 'rarity_id'

  belongs_to :player_class,
             class_name: 'PlayerClass',
             foreign_key: 'player_class_id'

  belongs_to :card_set,
             class_name: 'CardSet',
             foreign_key: 'card_set_id'

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
  validates :rarity_id, :player_class_id, :card_set_id,
            presence: true,
            numericality: { only_integer: true }

  validates :collectible,
            inclusion: { in: [true, false] }

  validates :card_set, :player_class, :rarity,
            presence: true

  validates :cost,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0 },
            allow_nil: true

  validates_associated :player_class, :rarity, :card_set

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
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
  delegate :disenchant_reward, :craft_cost, to: :rarity, prefix: false
  delegate :name, to: :card_set, prefix: true
  delegate :name, :hero, :colour, :hexcolour, to: :player_class, prefix: true
  alias_attribute :mana, :cost
  alias_attribute :disenchant_value, :disenchant_reward
  alias_attribute :type, :card_type

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

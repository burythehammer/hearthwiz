class PlayerClass < ActiveRecord::Base
  has_many :cards
  validates :name, presence: true, uniqueness: true
  validates :hero, uniqueness: true, length: { maximum: 50 }

  validates :colour,
            presence: true,
            length: { maximum: 50 }

  validates :hexcolour,
            presence: true,
            length: { is: 7 },
            format: /\A(#[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/
end

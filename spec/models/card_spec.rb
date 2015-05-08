require 'spec_helper'

RSpec.describe Card, type: :model do
  it 'should be collectible' do
    card = Card.new
    card.collectible = true
    card.should be_collectible
  end

  it 'should have a rarity'
end

require 'spec_helper'

RSpec.describe Card, type: :model do
  context ':json_id' do
    it 'should have a json id'
  end

  context ':player_class' do
    it 'should have a player class'
    it 'should default to neutral player class'
  end

  context ':card_set' do
    it 'should have a card set'
  end

  context ':card_type' do
    it 'should have a card type'

    context ':minion' do
      it 'should have a mana cost'
      it 'should have an attack value'
      it 'should have a health value'
    end

    context ':spell' do
      it 'should have a mana cost'
    end

    context ':weapon' do
      it 'should have a mana cost'
      it 'should have an attack value'
      it 'should have a durability which is numeric'
    end
  end

  context ':rarity' do
    it 'should have a rarity'
    it 'should default to common rarity'
  end

  context ':collectible' do
    it 'should be collectible'
  end

end

require 'spec_helper'

RSpec.describe Card, type: :model do
  it 'has valid factories' do
    expect(FactoryGirl.create(:minion_card)).to be_valid
    expect(FactoryGirl.create(:weapon_card)).to be_valid
    expect(FactoryGirl.create(:spell_card)).to be_valid
  end

  let(:card) { FactoryGirl.build(:minion_card) }

  # HAPPY PATHS

  it 'should have a name' do
    expect(card.name).to be_a(String)
  end

  it 'should have a cost' do
    expect(card.cost).to be_an(Integer)
  end

  it 'should have a rarity id' do
    expect(card.rarity_id).to be_an(Integer)
  end

  it 'should have a card type' do
    expect(card.card_type).to be_a(String)
  end

  it 'should have a player class id' do
    expect(card.player_class_id).to be_an(Integer)
  end

  it 'should have a card set id' do
    expect(card.card_set_id).to be_an(Integer)
  end

  it 'should have a collectible boolean' do
    expect(card.collectible).to be_boolean
  end

  context 'minion card' do
    let(:card) { FactoryGirl.build(:minion_card) }
    it 'should have a positive numeric mana cost' do
      expect(card.mana).to be_an(Integer)
      expect(card.mana).to be >= 0
    end

    it 'should have a positive numeric attack value' do
      expect(card.attack).to be_an(Integer)
      expect(card.attack).to be >= 0
    end

    it 'should have a positive numeric health value' do
      expect(card.health).to be_an(Integer)
      expect(card.health).to be >= 0
    end

    it 'should not have a durability value' do
      expect(card.durability).to be_nil
    end
  end

  context 'spell card' do
    let(:card) { FactoryGirl.build(:spell_card) }
    it 'should have a positive numeric mana cost' do
      expect(card.mana).to be_an(Integer)
      expect(card.mana).to be >= 0
    end

    it 'should not have a health value' do
      expect(card.health).to be_nil
    end

    it 'should not have an attack value' do
      expect(card.attack).to be_nil
    end

    it 'should not have a durability value' do
      expect(card.durability).to be_nil
    end
  end

  context ':weapon' do
    let(:card) { FactoryGirl.build(:weapon_card) }

    it 'should have a positive numeric mana cost' do
      expect(card.mana).to be_an(Integer)
      expect(card.mana).to be >= 0
    end

    it 'should have a positive numeric attack value' do
      expect(card.attack).to be_an(Integer)
      expect(card.attack).to be >= 0
    end

    it 'should have a positive numeric durability' do
      expect(card.durability).to be_an(Integer)
      expect(card.durability).to be >= 0
    end

    it 'should not have a health value' do
      expect(card.health).to be_nil
    end
  end

  # UNHAPPY PATHS
  context 'invalid json id' do
    let(:card) { FactoryGirl.build(:minion_card, json_id: nil) }
    it 'is invalid without a json id' do
      expect(card).to_not be_valid
    end
  end

  context 'invalid player class' do
    let(:card) { FactoryGirl.build(:minion_card, player_class_id: nil) }
    it 'should default to neutral player class' do
      # expect(card.player_class.name).to eq('Neutral')
    end
  end

  context 'invalid rarity' do
    it 'should default to common rarity' do
      # expect(card.rarity.name).to eq('Common')
    end
  end
end

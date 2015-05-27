require 'spec_helper'

RSpec.describe Card, type: :model do
  it 'has valid factories' do
    expect(FactoryGirl.create(:card, :minion)).to be_valid
    expect(FactoryGirl.create(:card, :spell)).to be_valid
    expect(FactoryGirl.create(:card, :weapon)).to be_valid
  end

  subject { FactoryGirl.build(:card) }

  let(:card) { FactoryGirl.build(:card) }
  let(:minion) { FactoryGirl.create(:card, :minion) }
  let(:spell) { FactoryGirl.create(:card, :spell) }
  let(:weapon) { FactoryGirl.create(:card, :weapon) }

  describe 'json_id' do
    it { should validate_presence_of :json_id }
    it { should validate_uniqueness_of :json_id }

    it 'should be a string' do
      expect(card.json_id).to be_a(String)
    end

    it 'should not be allowed to be nil' do
      expect(FactoryGirl.build(:card, :minion, json_id: nil)).to_not be_valid
    end
  end

  describe 'name' do
    it { should validate_presence_of :name }

    it 'should be a string' do
      expect(card.name).to be_a(String)
    end

    it 'should not be allowed to be nil' do
      expect(FactoryGirl.build(:card, :minion, name: nil)).to_not be_valid
    end
  end

  describe 'mana cost' do
    let(:positive_mana_cost)  { FactoryGirl.build(:card, :spell, mana: 1) }
    let(:negative_mana_cost)  { FactoryGirl.build(:card, :spell, mana: -1) }

    it 'should be an integer' do
      expect(card.cost).to be_an(Integer)
    end

    it 'should be valid when positive' do
      expect(positive_mana_cost).to be_valid
    end

    it 'should be invalid when negative' do
      expect(negative_mana_cost).to_not be_valid
    end
  end

  describe 'rarity' do
    it { should belong_to :rarity }
    it { should validate_presence_of :rarity }
    it { should validate_presence_of :rarity_id }
    it { should validate_numericality_of :rarity_id }

    it 'should have an Integer rarity id' do
      expect(card.rarity_id).to be_an(Integer)
    end
  end

  describe 'card type' do
    it { should validate_presence_of :card_type }

    it 'should be a string' do
      expect(minion.card_type).to be_a(String)
    end
  end

  describe 'collectible' do
    it 'should be boolean' do
      expect(card.collectible).to be_boolean
    end
  end

  describe 'player class' do
    it { should belong_to :player_class }
    it { should validate_presence_of :player_class_id }
    it { should validate_presence_of :player_class }
    it { should validate_numericality_of :player_class_id }

    it 'should have an integer id' do
      expect(card.player_class_id).to be_an(Integer)
    end
  end

  describe 'card set' do
    it { should belong_to :card_set }
    it { should validate_presence_of :card_set_id }
    it { should validate_presence_of :card_set }
    it { should validate_numericality_of :card_set_id }

    it 'should have a card set id' do
      expect(card.card_set_id).to be_an(Integer)
    end
  end

  describe 'how to get gold' do
    it 'should have a string describing how to get gold' do
      expect(card.how_to_get_gold).to be_a(String)
    end
  end

  describe 'minion' do
    it 'should have a positive numeric mana cost' do
      expect(minion.cost).to be_an(Integer)
      expect(minion.cost).to be >= 0
    end

    it 'should have a positive numeric attack value' do
      expect(minion.attack).to be_an(Integer)
      expect(minion.attack).to be >= 0
    end

    it 'should have a positive numeric health value' do
      expect(minion.health).to be_an(Integer)
      expect(minion.health).to be >= 0
    end

    it 'should not have a durability value' do
      expect(minion.durability).to be_nil
    end

    it 'should have a elite boolean' do
      expect(minion.elite).to be_boolean
    end

    it 'should have a race string' do
      expect(minion.race).to be_a(String)
    end
  end

  describe 'spell' do
    it 'should be valid' do
      expect(spell).to be_valid
    end

    it 'should have a positive numeric mana cost' do
      expect(spell.cost).to be_an(Integer)
      expect(spell.cost).to be >= 0
    end

    it 'should not have a health value' do
      expect(spell.health).to be_nil
    end

    it 'should not have an attack value' do
      expect(spell.attack).to be_nil
    end

    it 'should not have a durability value' do
      expect(spell.durability).to be_nil
    end

    it 'should not have a elite boolean' do
      expect(spell.elite).to be_nil
    end
  end

  describe 'weapon' do
    it 'should have a positive numeric attack value' do
      expect(weapon.attack).to be_an(Integer)
      expect(weapon.attack).to be >= 0
    end

    it 'should have a positive numeric durability' do
      expect(weapon.durability).to be_an(Integer)
      expect(weapon.durability).to be >= 0
    end

    it 'should not have a health value' do
      expect(weapon.health).to be_nil
    end

    it 'should not have a elite boolean' do
      expect(weapon.elite).to be_nil
    end
  end

  describe 'empty' do
    describe 'name' do
    end

    describe 'player class' do
      let(:card) { FactoryGirl.build(:card, :minion, player_class_id: nil) }
      it 'should be invalid' do
        expect(card).to_not be_valid
      end
    end

    describe 'rarity' do
      let(:card) { FactoryGirl.build(:card, :minion, rarity_id: nil) }
      it 'should be invalid' do
        expect(card).to_not be_valid
      end
    end
  end

  describe 'invalid input' do
  end
end

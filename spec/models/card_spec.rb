require 'spec_helper'

RSpec.describe Card, type: :model do
  it 'has valid factories' do
    expect(FactoryGirl.create(:card, :minion)).to be_valid
    expect(FactoryGirl.create(:card, :spell)).to be_valid
    expect(FactoryGirl.create(:card, :weapon)).to be_valid
  end

  describe 'validations' do
    subject { FactoryGirl.build(:card) }

    it { should validate_presence_of :json_id }
    it { should validate_uniqueness_of :json_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :rarity }
    it { should validate_presence_of :rarity_id }
    it { should validate_presence_of :card_type }
    it { should validate_presence_of :player_class_id }
    it { should validate_presence_of :player_class }
    it { should validate_presence_of :card_set_id }
    it { should validate_presence_of :card_set }
  end

  describe 'associations' do
    subject { FactoryGirl.build(:card) }

    it { should belong_to :rarity }
    it { should belong_to :card_set }
    it { should belong_to :player_class }
  end

  describe 'numericality' do
    subject { FactoryGirl.build(:card) }

    it { should validate_numericality_of :rarity_id }
    it { should validate_numericality_of :player_class_id }
    it { should validate_numericality_of :card_set_id }
  end

  describe 'column types' do
    let(:card) { FactoryGirl.build(:card, :minion) }

    it 'should have a String name' do
      expect(card.name).to be_a(String)
    end

    it 'should have an Integer cost' do
      expect(card.cost).to be_an(Integer)
    end

    it 'should have an Integer rarity id' do
      expect(card.rarity_id).to be_an(Integer)
    end

    it 'should have a String card type' do
      expect(card.card_type).to be_a(String)
    end

    it 'should have a collectible boolean' do
      expect(card.collectible).to be_boolean
    end

    it 'should have a string describing how to get gold' do
      expect(card.how_to_get_gold).to be_a(String)
    end

    it 'should have a json_id string' do
      expect(card.json_id).to be_a(String)
    end

    it 'should have a player class id' do
      expect(card.player_class_id).to be_an(Integer)
    end

    it 'should have a card set id' do
      expect(card.card_set_id).to be_an(Integer)
    end
  end

  describe 'minion' do
    let(:card) { FactoryGirl.build(:card, :minion) }

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

    it 'should have a elite boolean' do
      expect(card.elite).to be_boolean
    end

    it 'should have a race string' do
      expect(card.race).to be_a(String)
    end
  end

  describe 'spell' do
    let(:card) { FactoryGirl.build(:card, :spell) }

    it 'should be valid' do
      expect(card).to be_valid
    end

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

    it 'should not have a elite boolean' do
      expect(card.elite).to be_nil
    end
  end

  describe 'weapon' do
    let(:card) { FactoryGirl.build(:card, :weapon) }

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

    it 'should not have a elite boolean' do
      expect(card.elite).to be_nil
    end
  end

  describe 'empty' do
    describe 'json id' do
      let(:card) { FactoryGirl.build(:card, :minion, json_id: nil) }
      it 'should be invalid' do
        expect(card).to_not be_valid
      end
    end

    describe 'name' do
      let(:card) { FactoryGirl.build(:card, :minion, name: nil) }
      it 'should be invalid' do
        expect(card).to_not be_valid
      end
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

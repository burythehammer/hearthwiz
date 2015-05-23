require 'rails_helper'

RSpec.describe PlayerClass, type: :model do
  it 'has valid factories' do
    expect(FactoryGirl.create(:player_class)).to be_valid
  end

  subject { FactoryGirl.build(:player_class) }

  describe 'name' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'hero' do
    let(:short) { FactoryGirl.build(:player_class, hero: 'David') }
    let(:long) { FactoryGirl.build(:player_class, hero: Faker::Lorem.paragraph) }

    it { should validate_length_of :hero }
    it { should validate_uniqueness_of :hero }

    it 'should accept short strings' do
      expect(short).to be_valid
    end

    it 'should not accept long strings' do
      expect(long).to_not be_valid
    end

    it 'should provide the correct value' do
      expect(short.hero).to eq('David')
    end
  end

  describe 'colour' do
    let(:short) { FactoryGirl.build(:player_class, colour: 'Purple') }
    let(:long) { FactoryGirl.build(:player_class, colour: Faker::Lorem.paragraph) }

    it { should validate_presence_of :colour }
    it { should validate_length_of :colour }

    it 'should accept a short colour string' do
      expect(short).to be_valid
    end

    it 'should not accept a long colour string' do
      expect(long).to_not be_valid
    end

    it 'should provide the correct value' do
      expect(short.colour).to eq('Purple')
    end
  end

  describe 'hexcolour' do
    let(:valid) { FactoryGirl.build(:player_class, hexcolour: '#ABC000') }
    let(:invalid) { FactoryGirl.build(:player_class, hexcolour: '#ABC0001') }

    it { should validate_presence_of :hexcolour }
    it { should validate_length_of :hexcolour }

    it 'should accept appropriately formatted strings' do
      expect(valid).to be_valid
    end

    it 'should not accept any other format of string' do
      expect(invalid).to_not be_valid
    end

    it 'should provide the correct value' do
      expect(valid.hexcolour).to eq('#ABC000')
    end
  end
end

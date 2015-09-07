require 'factory_girl'
Dir.glob(File.join(File.dirname(__FILE__), '../../spec/factories/*.rb')).each { |f| require f }

module TestWorld

  @instance
  @cards = Hash.new

  def get
    @instance ||= TestWorld.new
  end

  def clean
    @cards.clear
  end

  def new_card (card_alias, card_type)
    case card_type
      when 'minion' then
        return new_minion_card(card_alias)
      when 'spell' then
        return new_spell_card(card_alias)
      when 'weapon' then
        return new_weapon_card(card_alias)
      else
        throw new Exception
    end
  end

  def new_minion_card(card_alias)
    @cards[card_alias] = FactoryGirl.create(:card, :minion)
  end

  def new_spell_card(card_alias)
    @cards[card_alias] = FactoryGirl.create(:card, :spell)
  end

  def new_weapon_card(card_alias)
    @cards[card_alias] = FactoryGirl.create(:card, :weapon)
  end

  def get_card(card_alias)
    @cards.get(card_alias)
  end


end
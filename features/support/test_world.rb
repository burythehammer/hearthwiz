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

  def add_card (card_alias, card)
    @cards[card_alias] = card
  end

  def new_random_card(card_alias)
    Factory(:card)
  end

  def new_spell_card()
    Facto
  end

  def get_card_by_alias(card_alias)
    @cards.get(card_alias)
  end


end
class CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.where(collectible: true).where.not(card_type: "Hero")
    @cards = @cards.sort_by {|c| [c.cost, c.name] }
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    begin
      set_card 
    rescue ActiveRecord::RecordNotFound 
      flash[:error] = 'That card could not be found!'
      redirect_to action: "index"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
        @card = Card.find(params[:id])
        @rarity = Rarity.find(@card.rarity_id)
        @quickInfo = getCardQuickInfo
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :cost, :rarity)
    end


    def getCardQuickInfo
      quickInfo = Hash.new

      quickInfo[:cost] = @card.cost
      quickInfo[:health] = @card.health if minion?
      quickInfo[:attack] = @card.attack if minion?
      quickInfo[:rarity] = @rarity.name
      quickInfo[:disenchant] = @rarity.disenchant_value if disenchantable?
#      quickInfo[] = @card.
#      quickInfo[:durability] = @card.
    end

    def weapon?
      return @card.card_type == "Weapon"
    end

    def minion?
      return @card.card_type == "Minion"
    end

    def disenchantable?
#      TODO
    end

end
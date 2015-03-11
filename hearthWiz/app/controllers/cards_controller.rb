class CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.where(collectible: true).where.not('cards.cost' => nil)
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
        @quickInfo = @card.getCardQuickInfo
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :cost, :rarity)
    end

end
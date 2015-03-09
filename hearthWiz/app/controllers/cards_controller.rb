class CardsController < ApplicationController
  before_action :set_card, only: [:update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
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
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :cost, :rarity)
    end

end
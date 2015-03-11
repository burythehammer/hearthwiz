class CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.where(collectible: true).where.not('cards.cost' => nil)
    @cards = @cards.sort_by {|c| [c.cost, c.name] }
  end

  # GET /cards/1
  # GET /cards/1.json
  def show_by_id
    begin
      set_card 
      render 'show'
    rescue ActiveRecord::RecordNotFound 
      flash[:error] = 'That card ID could not be found!'
      redirect_to action: "index"
    end

    
    
  end

  def show_by_name
    begin
      set_card_by_name 
      render 'show'
    rescue ActiveRecord::RecordNotFound 
      flash[:error] = 'That card name could not be found!'
      redirect_to action: "index"
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
        @card = Card.find(params[:id])
    end

    def set_card_by_name
        @card = Card.find_by name: params[:name]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :cost, :rarity)
    end

end
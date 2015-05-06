# Controller for cards.
# Maintains logic between views/model.
# Cards can be viewed as a list, a single card (by id or name)
class CardsController < ApplicationController
  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.where(collectible: true).where.not('cards.cost' => nil)
    @cards = @cards.sort_by { |c| [c.cost, c.name] }
    render 'card-list'
  end

  # GET /cards/1
  # GET /cards/1.json
  def show_by_id
    set_card
    render 'card-page'
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That card ID could not be found!'
    redirect_to action: 'index'
  end

  def show_by_name
    set_card_by_name
    render 'card-page'
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That card name could not be found!'
    redirect_to action: 'index'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  def set_card_by_name
    @card = Card.find_by name: params[:name]
  end

  # only allow the white list through.
  def card_params
    params.require(:card).permit(:name, :cost, :rarity)
  end
end

class CardSetsController < ApplicationController
  before_action :set_card_set, only: [:show]

  # GET /card_sets
  # GET /card_sets.json
  def index
    @card_sets = CardSet.all
  end

  # GET /card_sets/1
  # GET /card_sets/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_set
      @card_set = CardSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_set_params
      params[:card_set]
    end
end

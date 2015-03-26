class PlayerClassesController < ApplicationController
  before_action :set_player_class, only: [:show, :edit, :update, :destroy]

  # GET /player_classes
  # GET /player_classes.json
  def index
    @player_classes = PlayerClass.all
  end

  # GET /player_classes/1
  # GET /player_classes/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_class
      @player_class = PlayerClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_class_params
      params[:player_class]
    end
end

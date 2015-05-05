# Player Class controller.
# A player class is a type of character the player can choose.
# e.g. Wizard (Jaina)
# Cards are sometimes restricted by class.
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

  def set_player_class
    @player_class = PlayerClass.find(params[:id])
  end

  def player_class_params
    params[:player_class]
  end
end

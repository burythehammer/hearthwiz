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

  # GET /player_classes/new
  def new
    @player_class = PlayerClass.new
  end

  # GET /player_classes/1/edit
  def edit
  end

  # POST /player_classes
  # POST /player_classes.json
  def create
    @player_class = PlayerClass.new(player_class_params)

    respond_to do |format|
      if @player_class.save
        format.html { redirect_to @player_class, notice: 'Player class was successfully created.' }
        format.json { render :show, status: :created, location: @player_class }
      else
        format.html { render :new }
        format.json { render json: @player_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_classes/1
  # PATCH/PUT /player_classes/1.json
  def update
    respond_to do |format|
      if @player_class.update(player_class_params)
        format.html { redirect_to @player_class, notice: 'Player class was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_class }
      else
        format.html { render :edit }
        format.json { render json: @player_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_classes/1
  # DELETE /player_classes/1.json
  def destroy
    @player_class.destroy
    respond_to do |format|
      format.html { redirect_to player_classes_url, notice: 'Player class was successfully destroyed.' }
      format.json { head :no_content }
    end
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

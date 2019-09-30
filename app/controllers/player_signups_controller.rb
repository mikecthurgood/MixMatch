class PlayerSignupsController < ApplicationController
  before_action :set_player_signup, only: [:show, :edit, :update, :destroy]

  # GET /player_signups
  # GET /player_signups.json
  def index
    @player_signups = PlayerSignup.all
  end

  # GET /player_signups/1
  # GET /player_signups/1.json
  def show
  end

  # GET /player_signups/new
  def new
    @player_signup = PlayerSignup.new
  end

  # GET /player_signups/1/edit
  def edit
  end

  # POST /player_signups
  # POST /player_signups.json
  def create
    @player_signup = PlayerSignup.new(player_signup_params)

    respond_to do |format|
      if @player_signup.save
        format.html { redirect_to @player_signup, notice: 'Player signup was successfully created.' }
        format.json { render :show, status: :created, location: @player_signup }
      else
        format.html { render :new }
        format.json { render json: @player_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_signups/1
  # PATCH/PUT /player_signups/1.json
  def update
    respond_to do |format|
      if @player_signup.update(player_signup_params)
        format.html { redirect_to @player_signup, notice: 'Player signup was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_signup }
      else
        format.html { render :edit }
        format.json { render json: @player_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_signups/1
  # DELETE /player_signups/1.json
  def destroy
    @player_signup.destroy
    respond_to do |format|
      format.html { redirect_to player_signups_url, notice: 'Player signup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_signup
      @player_signup = PlayerSignup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_signup_params
      params.require(:player_signup).permit(:listing_id, :player_id)
    end
end

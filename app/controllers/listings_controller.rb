class ListingsController < ApplicationController
  before_action :require_logged_in
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  # GET /listings
  # GET /listings.json
  def index
    if !params[:activity_id].blank?
      @listings = Listing.all.where(activity_id: params[:activity_id]).sort_by(&:date)
    else
      @listings = Listing.all.search(params[:query]).sort_by(&:date)
    end
  end

  def remove_player
    listing = Listing.find(params[:listing_id])
    signup = PlayerSignup.find_by(listing_id: listing.id, player_id: @user.id)
    signup.destroy
    flash[:notice] = "You're no longer attending this event. We've let the organiser know and removed it from your events"
    redirect_to listing_path(listing)
  end

  def join
    listing = Listing.find(params[:id])
    if listing.players.include? @user
      redirect_to listing_path(listing)
      flash[:notice] = "You're already signed up to this event!"
    elsif listing.organiser_id == @user.id
      redirect_to listing_path(listing)
      flash[:notice] = "You can't sign up to your own event!"
    else
      listing.players << @user
      activity = Activity.find(listing.activity_id)
      redirect_to listing_path(listing)
      flash[:notice] = "You're all signed up for #{activity.name}! It's been added to your profile."
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @activity = Activity.find(@listing.activity_id)
    @venue = Venue.find(@listing.venue_id)
    @organiser = User.find(@listing.organiser_id)
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    unless @user.id == @listing.organiser_id
      redirect_to listing_path(@listing)
      flash[:notice] = "Sorry, you cannot edit someone elses listing."
    end
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.organiser_id = @user.id
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :venue_id, :activity_id, :organiser_id, :num_players, :description, :date)
    end
end

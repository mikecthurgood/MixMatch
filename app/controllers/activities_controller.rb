class ActivitiesController < ApplicationController
  before_action :require_logged_in
  before_action :set_activity, only: [:show, :edit, :destroy, :create]
  before_action :require_admin?, only: [:delete, :update]

    

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all.where(authorised: true).search(params[:query])
  end

  # GET /activities/some-stuff
  # GET /activities/:slug
  # GET /activities/1.json
  def show
    @activity = Activity.find_by_slug(params[:id])
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to "activities/#{@activity.slug}", notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    @activity = Activity.find_by_slug(params[:id])
    
    respond_to do |format|
      byebug
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    Activity.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :description, :image_url, :wiki_link, :authorised)
    end
end

class AdminsController < ApplicationController

  before_action :require_logged_in
  before_action :require_admin?

  def index
    @not_activities = Activity.unauthorised_activities
  end

  def new_activity
    @activity = Activity.new
  end

  def unauthorised_activities
    @not_activities = Activity.unauthorised_activities
    # byebug
  end

  def authorise
    @activity = Activity.find_by_slug(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    flash[:notice] = "You have successfully added #{@activity.name} to the list of authorised activities!"
    redirect_to unauthorised_activities_path
  end

  def destroy_unauthorised_activity
    Activity.destroy(params[:id])
    redirect_to unauthorised_activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :image_url, :wiki_link, :authorised)
  end

end

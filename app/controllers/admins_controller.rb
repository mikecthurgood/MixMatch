class AdminsController < ApplicationController

  before_action :require_admin?

  def index
    @not_activities = Activity.unauthorised_activities
  end

  def show
    
  end

  def unauthorised_activities
    @not_activities = Activity.unauthorised_activities
  end

  def authorise
    byebug
    @activity = Activity.find(params[:id])
  end

end

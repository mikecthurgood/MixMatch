class AdminsController < ApplicationController

  def index
  end

  def show
    
  end

  def unauthorised_activities
    @not_activities = Activity.unauthorised_activities
  end

  def authorise_activity
    
  end

end

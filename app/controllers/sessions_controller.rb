class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new]  

    def new
    end
  
    def create
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
  
      if user
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'welcome', action: 'home'
      else
        flash[:notice] = "Sorry, either your username or password is incorrect."
        redirect_to(controller: 'sessions', action: 'new') 
      end
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end
  end
  
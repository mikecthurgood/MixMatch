class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?
    helper_method :require_admin?
    before_action :current_user
  
    
    def current_user
      @user = (User.find_by(id: session[:user_id]) || User.new)
    end
  
    def logged_in?
      current_user.id != nil
    end
  
    def require_logged_out
      if logged_in?
        redirect_to root_path
      end
    end
    
    def require_logged_in
      unless logged_in?
        redirect_to login_path
      end
    end

    def require_admin?
      unless  @user.admin
        flash[:notice] = "Sorry only administrators can view this page"
        redirect_back(fallback_location: root_path)
      end
    end

end

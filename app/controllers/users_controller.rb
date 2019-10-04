class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_admin?, only: [:index, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if !@user
      redirect_to root_path
    end
    @num_total_attended = @profile.events_attended.length
    @num_organised = @profile.events_organised.length
    @organised = @profile.events_organised
    @activities = @profile.activities
    @listings = @profile.listings_attending
  end

  # GET /users/new
  def new
    if !logged_in?
      @user = User.new
    else
      redirect_to root_path
    end
  end

  # GET /users/1/edit
  def edit
    @profile = User.find(params[:id])
    if @user.admin || @profile.id == @user.id
      render "edit"
    else
      flash[:notice] = "You cannot edit someone else's profile."
      redirect_back(fallback_location: root_path)
    end
  end

  # def edit_password
  #   @profile = User.find(params[:id])
  #   render "edit_password"
  # end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render 'new'
      end
    end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @profile = User.find(params[:id])

      respond_to do |format|
        if @profile.update_attributes(user_params)
          format.html { redirect_to @profile, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @profile }
        else
          format.html { render :edit }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
  end

  def update_password
    @profile = User.find(params[:id])
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @profile = User.find(params[:id])
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @profile = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age, :bio, :email, :password, :password_confirmation)
    end
end

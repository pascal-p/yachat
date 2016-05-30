class SessionController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: [:create]

  def new
    @user = User.new
  end

  def create
    if @user
      log_in @user
      # params[:remember_me] == '1' ? remember(@user) : forget(@user) # TODO
      flash[:info] = "Log in successful"
      redirect_to root_path
    else
      flash[:warning] = 'Could not find your username'
      redirect_to signup_url
    end
  end

  def destroy   # @current_user session
    if logged_in?
      log_out
      flash[:info] = "Log out successful"
    end
    redirect_to root_url
  end

  private
  def set_user
    @user = User.find_by(user_params)
  end

  def user_params
    params.required(:user).permit(:username)
  end
end

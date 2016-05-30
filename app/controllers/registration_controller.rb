class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:info] = "username successfully created"
      redirect_to root_url
    else
      flash.now[:danger] = "The signup was unsuccessful."
      render "new"      
    end
  end

  private
  def user_params
    params.required(:user).permit(:username)
  end
end

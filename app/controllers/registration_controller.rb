class RegistrationController < ApplicationController
  skip_before_action :authenticate_user!, except: [:edit, :update, :destroy]

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

  def edit
    @user = current_user
    #else
    #  flash[:warning] = "You are not allowed to do that!"
    #  redirect_to root_url
    #end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:info] = "Profile updated successfully"
    else
      flash[:info] = "Profile update failure"
    end
    redirect_to root_url
  end

  # TODO
  def destroy
    @user = User.find(current_user.id)
    @user.archive
    flash[:info] = "Your account is now cancelled"
    log_out
    redirect_to root_url
  end

  private
  def user_params
    params.required(:user).permit(:username)
  end
end

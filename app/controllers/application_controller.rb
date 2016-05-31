class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  include SessionsHelper

  private
  def authenticate_user!
    redirect_to login_path unless current_user
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :restrict_user
  def restrict_user
    if session[:user_id].blank?
      redirect_to sign_in_users_path
      flash[:message] = "You are not authorized, please login"

  end
 end
end

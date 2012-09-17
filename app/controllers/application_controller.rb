class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  helper_method :logged_in?
  helper_method :current_user

  def authenticate
    redirect_to login_path unless logged_in? 
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

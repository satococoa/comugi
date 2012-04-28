class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  private
  def require_login
    redirect_to :root unless logged_in?
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  def logged_in?
    session[:user_id].present?
  end
end

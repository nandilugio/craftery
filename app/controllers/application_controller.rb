class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def check_user_logged
    redirect_to login_path unless logged_in?
  end

  before_filter :check_user_logged

end

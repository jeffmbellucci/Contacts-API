class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_session_token(params[:token])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to home_path unless logged_in?
  end

  def authorize(id)
    current_user.id = id
  end
end

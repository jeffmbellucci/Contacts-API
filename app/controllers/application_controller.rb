class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_session_token(params[:token])
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    return true if logged_in?

    render :text => "Make a session at: #{root_path}/sessions. Enter your username and password as parameters"
    false
  end
end

class SessionsController < ApplicationController
  def create
    user = User.log_in(params[:username], params[:password])

    if user
      user.session_token = random_token
      user.save
      render :json => user
    else
      render :text => "Forbidden", status: :forbidden
    end

  end

  def destroy
    user = User.find_by_session_token(params[:token])
    user.session_token = random_token
    user
    nil
  end

  private
  def random_token
    SecureRandom.urlsafe_base64
  end
end

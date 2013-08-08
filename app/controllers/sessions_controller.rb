class SessionsController < ApplicationController
  def create
    user = User.log_in(params[:username], params[:password])

    if user
      user.session_token = random_token
      render :json => user
    else
      render :text => "Forbidden", status: :forbidden
    end

  end

  def destroy
    user.session_token = random_token
    nil
  end

  private
  def random_token
    SecureRandom.urlsafe_base64
  end
end

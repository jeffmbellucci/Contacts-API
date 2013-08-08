class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :json => @user
    else
      render :json => @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:attrs])
    redirect_to user_url(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render :text => "User #{params[:id]} deleted."
  end
end

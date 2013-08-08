class FavoritesController < ApplicationController
  def index
    @favorite_contacts = Contact.favorited_for_user_id(params[:user_id])
    render :json => @favorite_contacts
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    if @favorite.save
      render :json => @favorite
    else
      render :json => @favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = Favorite.find_by_id(params[:id])
    if @favorite.destroy
      render :json => @favorite
    else
      render :json => @favorite.errors, status: :unprocessable_entity
    end
  end
end

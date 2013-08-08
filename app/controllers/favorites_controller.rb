class FavoritesController < ApplicationController
  def index
    @favorite_contacts = Contact.joins(:favorite).where("contacts.user_id = ?", params[:user_id])
    render :json => @favorite_contacts
  end

  def show
    @favorite_contact = Favorite.find(params[:id]).contact
    puts @favorite_contact.class
    render :json => @favorite_contact
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    if @favorite.save
      render :json => @favorite
    else
      render :json => @favorite.errors, status: :unprocessable_entity
    end
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update_attributes(params[:attrs])
    redirect_to user_contact_url(@favorite)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render :text => "We destroyed favorite #{params[:id]}!"
  end
end

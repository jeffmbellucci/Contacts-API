class ContactsController < ApplicationController

  def index
    @contacts = Contact.where("user_id = ?", params[:user_id])
    render :json => @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render :json => @contact
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.user_id = params[:user_id]

    if @contact.save
      render :json => @contact
    else
      render :json => @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(params[:attrs])
    render :json => @contact
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      render :json => @contact
    else
      render :json => @contact.errors, status: :unprocessable_entity
    end
  end
end

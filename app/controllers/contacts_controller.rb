class ContactsController < ApplicationController

  def new
  end

  def create
    @name = params[:name]
    
    ContactsMailer.notify_student(@current_user)
    redirect_to root_url, notice: "Email sent!"
  end

end

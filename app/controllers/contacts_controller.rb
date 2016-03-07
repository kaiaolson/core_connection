class ContactsController < ApplicationController

  def new
  end

  def create
    name = params[:name]
    message = params[:message]
    # puts "<<<<<" + @name + ">>>>>"
    ContactsMailer.notify_student(current_user, name, message).deliver_now
    redirect_to root_url, notice: "Email has been sent to the student."
  end

end

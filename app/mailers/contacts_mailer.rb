class ContactsMailer < ApplicationMailer
  def notify_student(user, name, message)
    @user = user
    @name = name
    @message = message
    mail(to: @user.email, subject: "#{@user.full_name} : New message from #{name}")
  end
end

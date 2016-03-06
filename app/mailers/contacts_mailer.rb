class ContactsMailer < ApplicationMailer
  def notify_student(user)
    @user = user
    mail(to: @user.email, subject: "#{@user.full_name}, New message from #{@name.titleize}")
  end
end

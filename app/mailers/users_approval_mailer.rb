class UsersApprovalMailer < ApplicationMailer
  def notify_admin(user, name, message)
    @user = user
    @name = name
    @message = message
    mail(to: @user.email, subject: "#{@user.full_name} : New message from #{name}")
  end
end

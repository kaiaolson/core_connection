class UsersApprovalMailer < ApplicationMailer

  def send_approval(user)
    @user = user
    mail(to: @user.email, subject: "Profile approved!")
  end

end

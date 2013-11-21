class UsersMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user_notification.subject
  #
  def new_user_notification(user)
    @user = user

    mail to: @user.email, subject: "Thanks for joining Hop To It!"
  end

  def password_reset(user)
    @user = user
    
    mail to: @user.email, subject: "Reset Your Password"
  end
end

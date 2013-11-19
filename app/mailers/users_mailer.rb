class UsersMailer < ActionMailer::Base
  default from: "juliepranger@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user_notification.subject
  #
  def new_user_notification(user)
    @user = user

    mail to: @user.email, subject: "Thanks for Joining Hop To It!"
  end

  def new_issue_notification(issue)
    @issue = issue
    @user = User.find(params[:id])

    mail to: @issue.user.email, subject: "Your Issue Has Been Created!"
  end
end

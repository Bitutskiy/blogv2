class UserMailer < ApplicationMailer
  def daily_mail(user)
    @user = user
    mail to: user.email, subject: "Dayly digest"
    layout 'daily_mailer'
  end
end

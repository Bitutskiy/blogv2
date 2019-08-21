class UserMailer < ApplicationMailer

  def signup_mail(user)
    @user = user
    mail to: @user.email, subject: "Signup email"
  end

  def daily_mail(user, posts)
    @user = user
    @posts = posts
    mail to: @user.email, subject: "Dayly digest"
  end

  def weekly_mail(user)
    @user = user
    @posts = posts
    mail to: @user.email, subject: "Weekly digest"
  end

end

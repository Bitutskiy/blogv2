class UserMailer < ApplicationMailer

  def signup_mail(user)
    mail to: user.email, subject: "Signup email"
  end

  def digest_mail(user, posts, hiden)
    @user = user
    @posts = posts
    @hiden = hiden
    mail to: @user.email, subject: "#{@user.subscribtion} digest"
  end
end

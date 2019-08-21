# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def daily_mail
    @user = User.first
    @posts = Post.all
    UserMailer.daily_mail(@user, @posts)
  end
end

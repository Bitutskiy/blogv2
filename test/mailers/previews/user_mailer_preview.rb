# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def daily_mail
    @user = User.where(subscribtion:'daily')
    @posts = Post.all
    UserMailer.daily_mail(@user, @posts)
  end

  def weekly_mail
    @user = User.where(subscribtion:'weekly')
    @posts = Post.all
    UserMailer.daily_mail(@user, @posts)
  end
end

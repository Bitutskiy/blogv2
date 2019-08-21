# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def daily_mail
    user = User.where(subscribtion:'daily').first
    count = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).count
    hiden = count > 5
    if hiden
      posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).limit(5).order(created_at: :desc)
    else
      posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).order(created_at: :desc)
    end
    UserMailer.digest_mail(user, posts, hiden)
  end

  def weekly_mail
    user = User.where(subscribtion:'weekly').first
    count = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).count
    hiden = count > 10
    if hiden
      posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).limit(10).order(created_at: :desc)
    else
      posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.week).order(created_at: :desc)
    end
    UserMailer.digest_mail(user, posts, hiden)
  end

  def digest_mail
    user = User.where(email:'darmollive@gmail.com').take
    count = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).count
    hiden = count > 5
    if hiden
      posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).limit(10).order(created_at: :desc)
    else
      posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).order(created_at: :desc)
    end
    UserMailer.digest_mail(user, posts, hiden)
  end
end

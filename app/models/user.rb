class User < ApplicationRecord
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  @count_posts_daily_digest = 5
  @count_posts_weekly_digest = 10

  def self.send_daily_email_to_all_users
    User.where(subscribe: "daily") do |user|
      count = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).count
      hiden = count > @count_posts_daily_digest
      if hiden
        posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day).limit(@count_posts_daily_digest)
      else
        posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day)
      end
      UserMailer.digest_mail(user, posts, hiden)
    end
  end

  def self.send_weekly_email_to_all_users
    User.where(subscribe: "weekly") do |user|
      count = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.week).count
      hiden = count > @count_posts_weekly_digest
      if hiden
        posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.week).limit(@count_posts_weekly_digest)
      else
        posts = Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.week)
      end
      UserMailer.digest_mail(user, posts, hiden)
    end
  end

end

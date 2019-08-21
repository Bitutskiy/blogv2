class User < ApplicationRecord
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  def self.send_daily_email_to_all_users
    User.where(subscribe: "daily") do |usr|
      UserMailer.daily_mail(usr).deliver
    end
  end

  def self.send_weekly_email_to_all_users
    User.where(subscribe: "weekly") do |usr|
      UserMailer.daily_mail(usr).deliver
    end
  end

end

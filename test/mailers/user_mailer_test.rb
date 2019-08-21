require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "the truth" do
    UserMailer.with(
      user: User.first,
      posts: Post.where('created_at <= ? AND created_at >= ?', Time.now, Time.now - 1.day),
      hiden: true).digest_mail
  end
end

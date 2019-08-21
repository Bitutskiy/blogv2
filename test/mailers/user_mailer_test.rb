require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  def daily_mail
    UserMailer.with(user: User.first).daily_mail
  end
end

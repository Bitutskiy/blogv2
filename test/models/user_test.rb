require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user" do
    user = User.new
    assert_not user.save
  end

  test 'valid user' do
    user = User.new(password: 'password', email: 'john@example.com')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: 'password')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

end

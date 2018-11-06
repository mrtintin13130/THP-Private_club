require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(first_name: 'John', last_name: 'Wick', email: 'john@example.com')
    assert user.valid?
  end

  test 'invalid without names' do
    user = User.new(email: 'john@example.com')
    refute user.valid?, 'user is valid without a name'
  end

  test 'invalid without email' do
    user = User.new(first_name: 'John')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'invalid without first name' do
    user = User.new(email: 'john@example.com', last_name: 'Wick')
    refute user.valid?
  end
end

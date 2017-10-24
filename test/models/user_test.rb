require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "User", last_name: "Name", email: "user@example.com", password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "first name should be less than 25 characters" do
    @user.first_name = "a"*26
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "last name should be less than 25 characters" do
    @user.last_name = "a"*26
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be less than 255 characters" do
    @user.email = "a"*256
    assert_not @user.valid?
  end

  test "email should use proper format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower case" do
    mixed_case_email = "Foo@ExAmple.Com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

end

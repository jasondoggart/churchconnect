require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get user_session_path
    post user_session_path, params: { user: { email: "", password: "" } }
    assert_not flash.empty?
    assert_template 'devise/sessions/new'
  end

  test "login with valid information" do
    get user_session_path
    @user = User.create(first_name: "user", last_name: "user", email: "example@example.com", password: "password", password_confirmation: "password")
    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
    follow_redirect!
    assert_template 'users/show'
    delete destroy_user_session_path
    follow_redirect!
    assert_template 'static_pages/home'
  end
end

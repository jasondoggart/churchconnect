require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: { first_name: "",
                                         last_name: "",
                                         email: "invalid@example",
                                         password: "one",
                                         password_confirmation: "two" } }
    end
    assert_template 'devise/registrations/new'
  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: { first_name: "User",
                                         last_name: "Name",
                                         email: "valid@example.com",
                                         password: "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end

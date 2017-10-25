require 'test_helper'

class EditUserProfileTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test "update user profile" do
    @user = User.create(first_name: "user", last_name: "user", email: "example@example.com", password: "password", password_confirmation: "password")
    get user_session_path
    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
    follow_redirect!
    assert_template 'users/show'
    get edit_user_registration_path(@user)
    newEmail = "new@email.com"
    newFirstName = "NewFirstName"
    newLastName = "NewLastName"
    newStreetAddress = "NewStreet"
    newCity = "NewCity"
    newProvince = "NewProvince"
    newPostalCode = "N3W3W3"
    patch user_registration_path, params: { user: { email: newEmail, 
                                                    first_name: newFirstName, 
                                                    last_name: newLastName, 
                                                    street_address: newStreetAddress, 
                                                    city: newCity, 
                                                    province: newProvince, 
                                                    postal_code: newPostalCode, 
                                                    password: "", 
                                                    password_confirmation: "",
                                                    current_password: "password" } }
    @user.reload
    assert_equal newEmail, @user.email


  end
end

require 'test_helper'

class UserMinistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_ministry = user_ministries(:one)
  end

  test "should get index" do
    get user_ministries_url
    assert_response :success
  end

  test "should get new" do
    get new_user_ministry_url
    assert_response :success
  end

  test "should create user_ministry" do
    assert_difference('UserMinistry.count') do
      post user_ministries_url, params: { user_ministry: { ministry_id: @user_ministry.ministry_id, user_id: @user_ministry.user_id } }
    end

    assert_redirected_to user_ministry_url(UserMinistry.last)
  end

  test "should show user_ministry" do
    get user_ministry_url(@user_ministry)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_ministry_url(@user_ministry)
    assert_response :success
  end

  test "should update user_ministry" do
    patch user_ministry_url(@user_ministry), params: { user_ministry: { ministry_id: @user_ministry.ministry_id, user_id: @user_ministry.user_id } }
    assert_redirected_to user_ministry_url(@user_ministry)
  end

  test "should destroy user_ministry" do
    assert_difference('UserMinistry.count', -1) do
      delete user_ministry_url(@user_ministry)
    end

    assert_redirected_to user_ministries_url
  end
end

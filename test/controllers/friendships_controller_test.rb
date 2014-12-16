require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.find_by_id(1)
    sign_in user
  end

  def login_user2
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.find_by_id(2)
    sign_in user
  end


  test "should get index" do
    login_user
    get :index
    assert_response :success
  end

  test "should get create" do
    login_user
    get(:create, friend_id: User.find_by_id(2))
    assert_redirected_to(root_url)
  end

  test "should get show" do
    login_user
    get(:show)
    assert_response :success
  end

  test "should get followers" do
    login_user
    get(:followers)
    assert_response :success
  end

  test "should get followedby" do
    login_user
    get(:followed_by)
    assert_response :success
  end

end

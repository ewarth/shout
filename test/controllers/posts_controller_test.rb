require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get new" do
    login_user
    get :new
    assert_response :success
  end

  test "should get create" do
    login_user
    get(:create, post: {post_text: 'test'})
    assert_redirected_to(controller: "friendships", action: "show")
  end

  test "should get show" do
    login_user
    assert_response :success
  end

  test "should get edit" do
    login_user
    get(:edit, post_id: Post.find_by_id(1))
    assert_response :success
  end

  test "should get change" do
    login_user
    get(:change, post:{id: 1 , post_text: "test"})
    assert_redirected_to(controller: "posts", action: "show")
  end

  test "should get favorite" do
    login_user
    get(:favorite, post_id: Post.find_by_id(1))
    assert_redirected_to(controller: "friendships", action: "show")
  end

  test "should get report" do
    login_user
    get(:report, post_id: Post.find_by_id(1))
    assert_redirected_to(controller: "friendships", action: "show")
  end

  test "should get delete" do
    login_user
    get(:delete, post_id: Post.find_by_id(1))
    assert_redirected_to(controller: "posts", action: "show")
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.find_by_id(1)
    sign_in user
  end

end

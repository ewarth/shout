require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get share" do
    get :share
    assert_response :success
  end

  test "should get favorite" do
    get :favorite
    assert_response :success
  end

  test "should get report" do
    get :report
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end

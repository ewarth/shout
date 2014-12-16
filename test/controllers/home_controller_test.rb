require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers


  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get friendships show" do
   login_user
    get :index
    assert_redirected_to(controller: "friendships", action: "show")
  end


  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.find_by_id(1)
    sign_in user
  end
end

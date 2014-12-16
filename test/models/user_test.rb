require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Shout Not Add User bad fnmae" do
    @user = User.new(:email => 'test@test.com', :first_name => "<>", :last_name => "test", :encrypted_password => "something")

    assert_not(@user.save, 'should have erred')
    @errors = @user.errors
    @error =  @errors[:first_name].first
    assert(@error == 'Only alphanumerics and "." allowed', @error + ' should have been "Only alphanumerics and "." allowed"')
  end

  test "Shout Not Add User bad lnmae" do
    @user = User.new(:email => 'test@test.com', :first_name => "test", :last_name => "<>", :encrypted_password => "something")

    assert_not(@user.save, 'should have erred')
    @errors = @user.errors
    @error =  @errors[:last_name].first
    assert(@error == 'Only alphanumerics and "." allowed', @error + ' should have been "Only alphanumerics and "." allowed"')
  end

  test "Shout Not Add User bad email" do
    @user = User.new(:email => 'test', :first_name => "test", :last_name => "test", :encrypted_password => "something")

    assert_not(@user.save, 'should have erred')
    @errors = @user.errors
    @error =  @errors[:email].first
    assert(@error == 'is invalid', @error + ' should have been "is invalid"')
  end
end

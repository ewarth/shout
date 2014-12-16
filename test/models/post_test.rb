require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "Shout Not Add Post too short" do
    @user = User.find_by_id(1)
    @text = ''
    @post = Post.new(:user_id => @user, :post_text => @text)
    assert_not(@post.save, 'should have erred')
    @errors = @post.errors
    @error =  @errors[:post_text].first
    assert(@error == 'can\'t be blank', @error + ' should have been "can\'t be blank"')
  end

  test "Shout Not Add Post invalid chars" do
    @user = User.find_by_id(1)
    @text = '<>'
    @post = Post.new(:user_id => @user, :post_text => @text)
    assert_not(@post.save, 'should have erred')
    @errors = @post.errors
    @error =  @errors[:post_text].first
    assert(@error == 'Invalid characters are contained in the post', @error + ' should have been "Invalid characters are contained in the post"')
  end

  test "Shout Add Post" do
    @user = User.find_by_id(1)
    @text = 'valid message'
    @post = Post.new(:user_id => @user, :post_text => @text)
    assert(@post.save, 'should have saved')
    @errors = @post.errors
    assert(@errors.empty?, 'should not have erred')
  end

end

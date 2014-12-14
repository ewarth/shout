class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(:user_id => current_user.id, :post_text => params[:post][:post_text])
    if @post.save
      flash[:notice] = "We heard your shout"
      redirect_to :controller => :friendships, :action => :show
    else
      @errors = @post.errors
      if @errors != nil
        flash[:notice] = @errors[:post_text].first
      else
        flash[:notice] = "Shout louder"
      end
      redirect_to :controller => :friendships, :action => :show
    end
  end

  def show
    @user = current_user
    @posts = Post.where(user_id: @user.id)
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def change
    @user = current_user
    @post = Post.find(params[:post][:id])
    if current_user.id == @post.user_id
      if @post.update(:post_text => params[:post][:post_text])
        flash[:notice] = "We heard your shout"
        redirect_to :controller => :posts, :action => :show
      else
        flash[:notice] = "Shout louder"
        redirect_to :controller => :posts, :action => :edit, :post_id => @post.id
      end
    else
      flash[:notice] = 'You tried editing someone else\'s post'
      redirect_to destroy_user_session_path,:method =>:delete
    end

  end

  def share
    @oldpost = Post.find(params[:post][:postId])
    @user = User.find(params[:post][:userId])
    @text = @user.firstname + " " + @user.lastname + " shouted \"" +oldpost.post_text + "\""
    @post = Post.new(:user_id =>current_user.id, :post_text => text, :reshouted => true)
    redirect_to :controller => :friendships, :action => :show
  end

  def favorite
    @post = Post.find(params[:post_id])
    @faved = Favorite.where(user_id: current_user.id, post_id: @post.id).first
    if(@faved == nil)
      if @post.update(:favorites => @post.favorites + 1)
        Favorite.create(:user_id => current_user.id, :post_id => @post.id)
        flash[:notice] = "Glad you liked it"
      else
        flash[:notice] = "Unable to favorite"
      end
    else
      flash[:notice] = "Already favorited"
    end
    redirect_to :controller => :friendships, :action => :show
  end

  def report
    @post = Post.find(params[:post_id])
    @reported = Report.where(user_id: current_user.id, post_id: @post.id).first
    if(@reported == nil)
      Report.create(:user_id => current_user.id, :post_id => @post.id)
      flash[:notice] = "Sorry you're upset. We'll look into it"
    else
      flash[:notice] = "Already reported"
    end
    redirect_to :controller => :friendships, :action => :show
  end

  def delete
    @post = Post.find(params[:post_id])
    if @post.destroy
      flash[:notice] = "You removed your shout"
    else
      flash[:notice] = "We couldn't remove your shout"
    end
    redirect_to :controller => :posts, :action => :show
  end
end

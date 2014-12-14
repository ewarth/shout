class FriendshipsController < ApplicationController

  def index
    @user = current_user
    @users = User.all
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Requested to follow."
      redirect_to root_url
    else
      flash[:error] = "Unable to follow."
      redirect_to root_url
    end
  end

  def show #TODO optimize the search and sort
    @user = current_user
    @friendships = current_user.friendships
    @shouts = Array.new
    @my_shouts = Post.where(:user_id => current_user.id)
    if @my_shouts != nil && @my_shouts.length != 0
      @shouts.push(*@my_shouts)
    end
    for friendship in @friendships
      if friendship.approved
        @temp_shouts = Post.where(:user_id => friendship.friend.id, :deactivated => false)
        if @temp_shouts != nil && @temp_shouts.length != 0
          @shouts.push(*@temp_shouts)
        end
      end
    end
    @shouts.sort! { |a,b| b.updated_at <=> a.updated_at }
  end

  def approve
    @friendship = current_user.inverse_friendships.find(params[:friend_id])
    @friendship.update_attribute(:approved, true)
    if @friendship.save
      flash[:notice] = "Approved follower."
      redirect_to root_url
    else
      flash[:error] = "Unable to approve follower."
      redirect_to root_url
    end
  end

  def disapprove
    @friendship = current_user.inverse_friendships.find(params[:friend_id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to root_url
  end
  
  def destroy
    @friendship = current_user.friendships.find(params[:friend_id])
    @friendship.destroy
    flash[:notice] ="Stopped following."
    redirect_to root_url
  end

  def followers
    @friendships = current_user.friendships
    for friendship in @friendships
      if friendship.approved
        @temp_shouts = Post.where(:user_id => friendship.friend.id, :deactivated => false)
        if @temp_shouts != nil && @temp_shouts.length != 0
          @shouts.push(*@temp_shouts)
        end
      end
    end
  end

  def followed_by

  end
end

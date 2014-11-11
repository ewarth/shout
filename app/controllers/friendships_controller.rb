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

  def show
    @user = current_user
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
end

class FriendshipsController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @friendships = current_user.friendships
    @inverse_friendships = current_user.inverse_friendships
    @shouts = Post.where(:user_id => current_user.id)
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:success] = "Requested to follow."
      redirect_to root_url
    else
      flash[:error] = "Unable to follow."
      redirect_to root_url
    end
  end

  def show #TODO optimize the search and sort
    @user = current_user
    if current_user == nil
      redirect_to root_url
    end

    if current_user.locked
      flash[:error] = "Your account is locked."
      sign_out_and_redirect(current_user)
    else
      @friendships = current_user.friendships
      @inverse_friendships = current_user.inverse_friendships
      @shouts = Array.new
      @ids = Array.new
      @ids.push(current_user.id)
      for friendship in @friendships
        if friendship.approved
          @ids.push(friendship.friend_id)
        end
      end
      @admins = User.where(:is_admin => true)
      for admin in @admins
        if(!@ids.include?(admin.id))
          @ids.push(admin.id)
        end
      end

      for id in @ids
        @temp_shouts = Post.where(:user_id => id, :deactivated => false)
        if @temp_shouts != nil && @temp_shouts.length != 0
          @shouts.push(*@temp_shouts)
        end
      end

      @shouts.sort! { |a,b| b.updated_at <=> a.updated_at }

      if @user.is_admin
        @reports = Array.new
        @reported = Report.all
        for report in @reported
          @reports.push(*Post.where(:id => report.post_id))
        end
        @reports.sort! { |a,b| b.updated_at <=> a.updated_at }

      end
    end
  end

  def approve
    @friendship = Friendship.find(params[:friend_id])
    if @friendship == nil
      flash[:error] = "Unable to approve follower."
    else
      @friendship.update_attribute(:approved, true)
      if @friendship.save
        flash[:success] = "Approved follower."
      else
        flash[:error] = "Unable to approve follower."
      end
    end
    redirect_to root_url
  end

  def disapprove
    @friendship = Friendship.find(params[:friend_id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to root_url
  end

  def destroy
    @friendship = Friendship.find(params[:friend_id])
    @friendship.destroy
    flash[:notice] ="Stopped following."
    redirect_to root_url
  end

  def followers
    @shouts=Array.new
    @user = current_user
    @friendships = current_user.friendships
    @inverse_friendships = current_user.inverse_friendships
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
    @user = current_user
    @friendships = current_user.friendships
    @shouts=Array.new
    if current_user == nil
      redirect_to root_url
    end
    @inverse_friendships = current_user.inverse_friendships


  end
end

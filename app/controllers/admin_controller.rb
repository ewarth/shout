class AdminController < ApplicationController
  def show
    if current_user == nil || !current_user.is_admin
      redirect_to :controller => :friendships, :action => :show
    end
    @admins = User.where(:is_admin => true)
    @users = User.where(:is_admin => false)
  end

  def promote
    if !current_user.is_admin
      redirect_to :controller => :friendships, :action => :show
    end
    @user =  User.find(params[:user])
    if @user == nil
      flash[:error] = "Unable to promote user to admin."
    else
      @user.update_attribute(:is_admin, true)
      if @user.save
        flash[:success] = "Promoted user to admin."
      else
        flash[:error] = "Unable to promote user to admin."
      end
    end
    redirect_to :controller => :admin, :action => :show
  end

  def demote
    if !current_user.is_admin
      redirect_to :controller => :friendships, :action => :show
    end
    @user =  User.find(params[:admin])
    if @user == nil
      flash[:error] = "Unable to demote admin to user."
    else
      @user.update_attribute(:is_admin, false)
      if @user.save
        flash[:success] = "Demoted admin to user."
      else
        flash[:error] = "Unable to demote amdin to user."
      end
    end
    redirect_to :controller => :admin, :action => :show
  end

  def lock
    if !current_user.is_admin
      redirect_to :controller => :friendships, :action => :show
    end
    @user =  User.find(params[:user])
    if @user == nil
      flash[:error] = "Unable to lock user."
    else
      @user.update_attribute(:locked, true)
      if @user.save
        flash[:success] = "Locked user."
      else
        flash[:error] = "Unable to lock user."
      end
    end
    redirect_to :controller => :admin, :action => :show
  end

  def unlock
    if !current_user.is_admin
      redirect_to :controller => :friendships, :action => :show
    end
    @user =  User.find(params[:user])
    if @user == nil
      flash[:error] = "Unable to unlock user."
    else
      @user.update_attribute(:locked, false)
      if @user.save
        flash[:success] = "Unlocked user."
      else
        flash[:error] = "Unable to unlock user."
      end
    end
    redirect_to :controller => :admin, :action => :show
  end
end

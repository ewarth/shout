class AdminController < ApplicationController
  before_filter :set_view_models

  def index
  end
  def lock_unlock_account

  end

  def lock

  end


  def lock
    @lock_user = User.find_by_id(params[:id])

    @value = @lock_user.locked
    if @lock_user.locked
      @lock_user.update(:locked => "true")
    else
      @lock_user.update(:locked => "false")
    end
    @lock_user.save!
    redirect_to :action => "lock_unlock_account"
  end


  protected

  def set_view_models
    @current_user = current_user
    @new_user = User.new
    @users = User.all
  end
end

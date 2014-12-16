class AdminController < ApplicationController
  before_filter :set_view_models

  def index
  end

  def new

  end

  def create
    @new_admin = User.new({:first_name=> params[:user][:first_name], :last_name=>params[:user][:last_name], :email=>params[:user][:email], :password=>params[:user][:password], :admin=>"true"})

    if @new_admin.save
      flash[:success] = "Admin created! Welcome to the shout team!!"
      redirect_to :controller => :admin, :action => :index
    else
      @errors = @new_admin.errors

        flash[:notice] = "Unable to create admin. The form has errors."

      redirect_to :controller => :admin, :action => :new
    end
  end

  def lock_unlock_account

  end

  def lock

  end


  def lock
    @lock_user = User.find(User.deobfuscate_id(params[:user][:id]))

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

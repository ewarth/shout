class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.try(:admin?)
        redirect_to :controller => :admin, :action => :index
      else
        redirect_to :controller => :friendships, :action => :show
      end
    end
  end
end

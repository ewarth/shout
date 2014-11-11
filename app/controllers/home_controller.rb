class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :controller => :friendships, :action => :show
    end
  end
end

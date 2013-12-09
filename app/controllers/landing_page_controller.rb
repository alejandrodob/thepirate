class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to user_home_path(current_user)
    end
  end
  
end

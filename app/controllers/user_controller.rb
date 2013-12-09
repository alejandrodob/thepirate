class UserController < ApplicationController

  def home
    @user = current_user
  end

  def profile
  end
end

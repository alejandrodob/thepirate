class FriendshipsController < ApplicationController

  def index
    @friendships = current_user.friendships
  end

  def new
    @friendship = current_user.friendships.build
  end

  def show
    @friendship = current_user.friendships.find(params[:friendship_id] || params[:id])
  end

  def create
    redirect_to current_user_path
  end
end

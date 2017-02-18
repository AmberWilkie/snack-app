class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend = User.find(params[:id])
    current_user.friend_request(friend)
  end

  def confirm
    friend = User.find(params[:id])
    current_user.accept_request(friend)
  end

end

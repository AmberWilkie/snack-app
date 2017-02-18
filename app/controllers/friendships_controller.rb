class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:id])
    current_user.friend_request(friend)
  end

end

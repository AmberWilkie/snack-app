class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(params[:id])
    current_user.friend_request(friend)
  end

end

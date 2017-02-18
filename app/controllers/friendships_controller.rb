class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_friend, only: [:create, :confirm]

  def create
    current_user.friend_request(@friend)
  end

  def confirm
    current_user.accept_request(@friend)
  end

  private

  def find_friend
    @friend = User.find(params[:id])
  end

end

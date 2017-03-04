class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user.friends
    @conversations = current_user.conversations
  end

  # def create
  #   @conversation = ConversationHelper.find_or_create_conversation(params, current_user, @user)
  #   redirect_to conversation_messages_path(@conversation)
  # end

end

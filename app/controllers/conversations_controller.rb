class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user.friends
    @conversations = current_user.conversations
    delete_echo_chamber
  end

  private

  # There is a custom validator on the conversation model but any old conversations that were created between the user and himself need to be spliced out here.
  def delete_echo_chamber
    @conversations.each do |convo|
      if convo.recipient_id == convo.sender_id
        @conversations.delete(convo)
      end
    end
  end

end

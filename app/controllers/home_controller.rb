class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show, :matches]

  def index

  end

  def show
    @user = User.find(params[:id])
    if current_user.friends.include?(@user)
      @conversation = ConversationHelper.find_or_create_conversation(params, current_user, @user)
    end
  end

  def matches
    @matches = []
    @users = User.all # I will eventually make this geographically-bounded.

    # Search algorithm to match language speakers with learners.
    current_user.learning_list.each do |learning|
      @users.each do |user|
        # Find users who speak the language current_user wants to learn,
        # and want to learn a language current_user speaks
        if user.language_list.include?(learning) && (user.learning_list & current_user.language_list).any?
          @matches << user
        end
      end
    end
    if @matches.include?(current_user)
      @matches.delete(current_user)
    end
    @matches.uniq!
  end

  private

  # def get_unread
  #   if current_user
  #     @unread = []
  #
  #     # Grab each conversation for the user and find all messages he hasn't read.
  #     current_user.conversations.each do |convo|
  #       if convo.messages.where(sender_read: false).any? && convo.sender_id == current_user.id
  #         @unread << convo.messages.where(sender_read: false)
  #       end
  #       if convo.messages.where(recipient_read: false).any? && convo.recipient_id == current_user.id
  #         @unread << convo.messages.where(recipient_read: false)
  #       end
  #     end
  #   end
  # end
end




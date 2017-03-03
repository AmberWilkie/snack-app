class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:matches]

  def index

  end

  def show
    @user = User.find(params[:id])

    # Extract this to a helper and remove from Conversations controller too
    if Conversation.between(current_user.id, @user.id).present?
      @conversation = Conversation.between(current_user.id, @user.id).first
    else
      @conversation = Conversation.create!({sender_id: current_user.id, recipient_id: @user.id})
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
end

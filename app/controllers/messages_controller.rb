class MessagesController < ApplicationController
  before_action :find_conversation, only: [:index, :new, :create]

  def index
    @messages = @conversation.messages.reverse
    mark_messages_as_read
    use_pagination(params)
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    if @conversation.nil?
      ConversationHelper.find_or_make_new_conversation(params)
    end
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def mark_messages_as_read
    @messages.each do |message|
      conversation = Conversation.find(message.conversation_id)
      current_user.id == conversation.sender_id ? message.sender_read = true :
          message.recipient_read = true
      message.save
    end
  end

  def use_pagination(params)
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
  end

end

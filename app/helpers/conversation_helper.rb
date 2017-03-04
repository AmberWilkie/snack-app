module ConversationHelper
  def self.find_or_create_conversation(params, sender, recipient)
    @params = params
    if Conversation.between(sender.id, recipient.id).present?
      @conversation = Conversation.between(sender.id, recipient.id).first
    else
      @conversation = Conversation.create!(sender_id: sender.id, recipient_id: recipient.id)
    end
  end

  def get_unread
    if current_user
      @unread = []

      # Grab each conversation for the user and find all messages he hasn't read.
      current_user.conversations.each do |convo|
        if convo.messages.where(sender_read: false).any? && convo.sender_id == current_user.id
          @unread << convo.messages.where(sender_read: false)
        end
        if convo.messages.where(recipient_read: false).any? && convo.recipient_id == current_user.id
          @unread << convo.messages.where(recipient_read: false)
        end
      end
    end
    @unread
  end
end

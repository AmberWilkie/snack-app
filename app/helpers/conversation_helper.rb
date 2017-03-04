module ConversationHelper
  def self.find_or_create_conversation(params, sender, recipient)
    @params = params
    if Conversation.between(sender.id, recipient.id).present?
      @conversation = Conversation.between(sender.id, recipient.id).first
    else
      @conversation = Conversation.create!(sender_id: sender.id, recipient_id: recipient.id)
    end
  end
end

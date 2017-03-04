class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id
  validate :no_conversations_with_self

  scope :between, -> (sender_id, recipient_id) do
    where(" (conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?) ", sender_id, recipient_id, recipient_id, sender_id)
  end

  private

  def no_conversations_with_self
    if sender_id == recipient_id
      errors.add(:echo_chamber, 'No conversations with yourself')
    end
  end

end

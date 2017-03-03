require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :sender_id }
    it { is_expected.to have_db_column :recipient_id }
  end

  describe 'Validations' do
    it { is_expected.to belong_to :recipient}
    it { is_expected.to belong_to :sender}
    it { is_expected.to have_many :messages}
  end

end

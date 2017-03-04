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

  describe 'Interactions' do
    let(:user1) { FactoryGirl.create(:user)}
    let(:user2) { FactoryGirl.create(:user)}

    it 'should have a valid factory' do
      expect(FactoryGirl.create(:conversation,
                                sender: user1,
                                recipient: user2)).to be_valid
    end

    it 'users should not have conversations with themselves' do
      convo = FactoryGirl.build(:conversation, sender: user1, recipient: user1)
      expect(convo).not_to be_valid
    end
  end

end

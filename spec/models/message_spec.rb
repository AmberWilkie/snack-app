require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :conversation_id }
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Validations' do
    it { is_expected.to belong_to :conversation}
    it { is_expected.to belong_to :user}
  end
end

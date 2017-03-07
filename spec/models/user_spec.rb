require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :location }
    it { is_expected.to have_db_column :blurb }
    it { is_expected.to have_db_column :gender }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :username}
    it { is_expected.to validate_uniqueness_of :username}

  end

  describe 'Associations' do
    it { is_expected.to have_many :friendships }
    it { is_expected.to have_many :messages }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end

  describe 'Languages' do
    let(:bob) { FactoryGirl.create(:user)}

    it 'should have a language list' do
      expect(bob.language_list).to be_truthy
    end

    it 'can add languages' do
      bob.language_list.add('French')
      expect(bob.language_list.last).to eq 'French'
    end

    it 'prevents non-accepted languages' do
      bob.language_list.add('Weird')
      bob.save
      expect(bob.language_list.last).not_to eq 'Weird'
    end

    it 'can add a bunch of languages at once and reject the non-accepted' do
      bob.language_list.add('Swahili', 'German', 'WEIRD', 'Hindi/Urdu', 'Not a language')
      bob.save
      expect(bob.language_list).to eq (['Swahili', 'German', 'Hindi/Urdu'])
    end
  end

  describe 'Learnings' do
    let(:jill) { FactoryGirl.create(:user)}

    it 'should have a learnings list' do
      expect(jill.learning_list).to eq []
    end

    it 'can add learnings' do
      jill.learning_list.add('French')
      expect(jill.learning_list.last).to eq 'French'
    end

    it 'prevents non-accepted learnings' do
      jill.learning_list.add('Weird')
      jill.save
      expect(jill.learning_list.last).not_to eq 'Weird'
    end

    it 'can add a bunch of learnings at once and reject the non-accepted' do
      jill.learning_list.add('Swahili', 'German', 'WEIRD', 'Hindi/Urdu', 'Not a language')
      jill.save
      expect(jill.learning_list).to eq (['Swahili', 'German', 'Hindi/Urdu'])
    end
  end

  describe 'Conversations' do
    let(:bob) { FactoryGirl.create(:user)}
    let(:jill) { FactoryGirl.create(:user)}
    let!(:conversation) { FactoryGirl.create(:conversation, sender: bob, recipient: jill)}

    it 'should have conversations' do
      expect(bob.conversations.first).to eq conversation
    end
  end
end
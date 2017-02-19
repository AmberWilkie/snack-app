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
  end

  describe 'Associations' do
    it { is_expected.to have_many :friendships }
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
      # binding.pry
      bob.save
      expect(bob.language_list.last).not_to eq 'Weird'
    end

  end
end
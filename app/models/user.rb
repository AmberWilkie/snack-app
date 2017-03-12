class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_friendship
  acts_as_taggable_on :languages, :learnings
  has_many :messages
  geocoded_by :location

  before_save :check_languages

  validates_presence_of :name
  validates_presence_of :username
  validates_uniqueness_of :username

  GENDERS = ['Female', 'Male', 'Other', 'Prefer Not to Say']
  LANGUAGES = ['Arabic', 'Azerbaijani', 'Basque', 'Bengali', 'Berber', 'Bulgarian', 'Burmese', 'Catalan', 'Chinese Wu', 'Chinese Yue', 'Chinese/Other', 'Croatian', 'Czech', 'Danish', 'Dutch', 'English', 'Estonian', 'Farsi', 'Finnish', 'French', 'Gaelic', 'Galician', 'German', 'Greek', 'Gujarati', 'Hausa', 'Hindi/Urdu', 'Hungarian', 'Italian', 'Japanese', 'Javanese', 'Kannada', 'Korean', 'Kurdish', 'Latvian', 'Lithuanian', 'Malay', 'Malayalam', 'Maltese', 'Mandarin', 'Marathi', 'Oriya', 'Polish', 'Portuguese', 'Punjabi', 'Romanian', 'Russian', 'Slovak', 'Slovenian', 'Spanish', 'Swahili', 'Swedish', 'Tamil', 'Telugu', 'Thai', 'Turkish', 'Ukranian', 'Vietnamese']

  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id)
  end

  private

  def check_languages

    self.language_list.each do |language|
      unless LANGUAGES.include?(language)
        self.language_list.delete(language)
      end
    end

    self.learning_list.each do |learning|
      unless LANGUAGES.include?(learning)
        self.learning_list.delete(learning)
      end
    end
  end
end

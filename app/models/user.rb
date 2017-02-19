class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_friendship
  acts_as_taggable_on :languages

  validates_presence_of :name

  GENDERS = ['Female', 'Male', 'Other', 'Prefer Not to Say']
  LANGUAGES = ['Arabic', 'Azerbaijani', 'Basque', 'Bengali', 'Berber', 'Bulgarian', 'Burmese', 'Catalan', 'Chinese Wu', 'Chinese Yue', 'Chinese/Other', 'Croatian', 'Czech', 'Danish', 'Dutch', 'English', 'Estonian', 'Farsi', 'Finnish', 'French', 'Gaelic', 'Galician', 'German', 'Greek', 'Gujarati', 'Hausa', 'Hindi/Urdu', 'Hungarian', 'Italian', 'Japanese', 'Javanese', 'Kannada', 'Korean', 'Kurdish', 'Latvian', 'Lithuanian', 'Malay', 'Malayalam', 'Maltese', 'Mandarin', 'Marathi', 'Oriya', 'Polish', 'Portuguese', 'Punjabi', 'Romanian', 'Russian', 'Slovak', 'Slovenian', 'Spanish', 'Swahili', 'Swedish', 'Tamil', 'Telugu', 'Thai', 'Turkish', 'Ukranian', 'Vietnamese']
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_friendship
  acts_as_taggable_on :languages

  validates_presence_of :name

  GENDERS = ['Female', 'Male', 'Other', 'Prefer Not to Say']
end

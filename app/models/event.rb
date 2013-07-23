class Event < ActiveRecord::Base
  before_save { organizer_email.downcase! }
  
  validates :organizer_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :organizer_email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
                              uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :date, presence: true
end

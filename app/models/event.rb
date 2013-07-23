class Event < ActiveRecord::Base

  before_save { organizer_email.downcase! }
  before_save { organizer_name.downcase! }
  before_save { title.downcase! }

  validates :organizer_name, presence: true, length: { maximum: 50, minimum: 4 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :organizer_email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
                              uniqueness: { case_sensitive: false }
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :date, presence: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end
end

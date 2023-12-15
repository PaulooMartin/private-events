class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User',
              inverse_of: 'hosted_events'

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :location, presence: true
  validates_presence_of :datetime
  validate :future_date_given?

  has_many :invitations, foreign_key: 'event_id', inverse_of: 'attended_event'
  has_many :attendees, through: :invitations

  scope :past, -> { where("datetime < ?", DateTime.current) }
  scope :future, -> { where("datetime > ?", DateTime.current) }

  private

  def future_date_given?
    unless datetime.future?
      errors.add(:datetime, "must be greater than the current date and time")
    end
  end
end

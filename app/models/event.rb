class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User',
              inverse_of: 'hosted_events'

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :location, presence: true
  validates :datetime, comparison: { greater_than_or_equal_to: DateTime.now,
            message: "must be greater than the current date and time"}

  has_many :invitations, foreign_key: 'event_id', inverse_of: 'attended_event'
  has_many :attendees, through: :invitations
end

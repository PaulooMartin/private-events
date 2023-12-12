class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User',
              inverse_of: 'hosted_events'

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :location, presence: true
  validates :datetime, comparison: { greater_than_or_equal_to: DateTime.now,
            message: "must be greater than the current date and time"}
end

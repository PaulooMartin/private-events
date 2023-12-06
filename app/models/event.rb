class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User',
              inverse_of: 'hosted_events'
end

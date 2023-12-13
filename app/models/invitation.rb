class Invitation < ApplicationRecord
  belongs_to :attended_event, foreign_key: "event_id", class_name: "Event", inverse_of: 'invitations'
  belongs_to :attendee, foreign_key: "user_id", class_name: "User", inverse_of: 'invitations'
end

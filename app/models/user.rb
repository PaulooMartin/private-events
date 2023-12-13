class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: {in: 3..14},
            format: { without: /\W/, message: "is invalid. It should only contain letters, numbers, and underscores."  }

  has_many :hosted_events, foreign_key: 'user_id', class_name: 'Event',
            dependent: :destroy, inverse_of: 'creator'

  has_many :invitations, foreign_key: 'user_id', inverse_of: 'attendee'
  has_many :attended_events, through: :invitations
end

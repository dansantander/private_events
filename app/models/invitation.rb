class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates :invitee, uniqueness: true
end

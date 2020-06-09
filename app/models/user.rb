class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :invitations, class_name: 'Invitation', foreign_key: 'invitee_id'
  has_many :attended_events, through: :invitations, source: :attended_event
end

class Event < ApplicationRecord
  belongs_to :user

  has_many :invitations, class_name: 'Invitation', foreign_key: 'attended_event_id'
  has_many :invitees, through: :invitations, source: :invitee
end

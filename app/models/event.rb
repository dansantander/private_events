class Event < ApplicationRecord
  belongs_to :user

  has_many :invitations, class_name: 'Invitation', foreign_key: 'attended_event_id'
  has_many :invitees, through: :invitations, source: :invitee


  scope :past, -> { where('event_date < ?', Date.today) }
  scope :upcoming, -> { where('event_date >= ?', Date.today) }

end

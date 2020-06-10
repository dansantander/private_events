class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :invitations, class_name: 'Invitation', foreign_key: 'attended_event_id'
  has_many :invitees, through: :invitations, source: :invitee

  scope :past, -> { where('event_date < ?', Date.today) }
  scope :upcoming, -> { where('event_date >= ?', Date.today) }

  validates :title, presence: true, length: { maximum: 50 }
  validates :event_date, presence: true
end

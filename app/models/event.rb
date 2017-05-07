class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  has_many :attendees, through: :events_atendees
  has_many :events_atendees, :foreign_key => "attended_event_id"

  scope :upcoming, -> { where("datum >= ?", DateTime.now)}
  scope :previous, -> { where("datum < ?", DateTime.now)}

  validates(:description, presence: true)
  validates(:datum, presence: true)

end

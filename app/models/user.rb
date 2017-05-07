class User < ApplicationRecord
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
  has_many :attended_events, through: :events_atendees
  has_many :events_atendees, :foreign_key => "attendee_id"



  def attending? event
    event.attendees.include?(self)
  end

  def attend event
    self.events_atendees.create(attended_event_id: event.id)
  end

  def upcoming_events
    @upcoming_events = self.attended_events.where("datum >= ?",DateTime.now)
  end

  def prev_events
    @prev_events = self.attended_events.where("datum < ?", DateTime.now)
  end

end

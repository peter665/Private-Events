class User < ApplicationRecord
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
  has_many :attended_events, through: :events_atendees
end
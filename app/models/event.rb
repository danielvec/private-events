class Event < ApplicationRecord
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  belongs_to :creator, class_name: "User"

  def self.past
    Event.where('events.date < ?', DateTime.now.in_time_zone('UTC'))
  end

  def self.upcoming
    Event.where('events.date > ?', DateTime.now.in_time_zone('UTC'))
  end
end

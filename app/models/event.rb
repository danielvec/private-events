class Event < ApplicationRecord
  has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendings, source: :event_attendee
  has_one_attached :image, dependent: :delete_all
  belongs_to :creator, class_name: "User"

  scope :past, -> { where('events.date < ?', DateTime.now.in_time_zone('UTC')) }
  scope :upcoming, -> { where('events.date > ?', DateTime.now.in_time_zone('UTC')) }

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
end

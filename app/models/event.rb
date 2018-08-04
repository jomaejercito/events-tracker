class Event < ActiveRecord::Base
  has_many :venue_events
  has_many :venues, through: :venue_events
  has_many :users, through: :venues
end

class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :venue_events
  has_many :events, through: :venue_events
end

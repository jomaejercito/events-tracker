class CreateVenueEvents < ActiveRecord::Migration
  def change
    create_table :venue_events do |t|
      t.integer :event_id
      t.integer :venue_id
    end
  end
end

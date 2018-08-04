class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.integer :user_id
      t.integer :event_id
    end
  end
end

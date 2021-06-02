class AddUniqueIndexToAttendings < ActiveRecord::Migration[6.1]
  def change
    add_index :attendings, [:attendee_id, :attended_event_id], unique: true
  end
end

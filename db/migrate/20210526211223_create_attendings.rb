class CreateAttendings < ActiveRecord::Migration[6.1]
  def change
    create_table :attendings do |t|
      t.string :attendee_id
      t.text :attended_event_id
       
      t.timestamps
    end
  end
end

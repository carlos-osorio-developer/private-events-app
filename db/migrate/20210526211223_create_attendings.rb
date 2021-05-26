class CreateAttendings < ActiveRecord::Migration[6.1]
  def change
    create_table :attendings do |t|
      t.belongs_to :attendee
      t.belongs_to :attended_event
       
      t.timestamps
    end
  end
end

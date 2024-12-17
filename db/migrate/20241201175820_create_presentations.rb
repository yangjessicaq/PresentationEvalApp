class CreatePresentations < ActiveRecord::Migration[7.2]
  def change
    create_table :presentations do |t|
      t.string :email1
      t.string :email2
      t.string :email3
      t.string :email4
      t.string :email5
      t.string :topic
      t.date :present_date
      t.time :present_start_time
      t.time :present_end_time
      t.string :location

      t.timestamps
    end
  end
end

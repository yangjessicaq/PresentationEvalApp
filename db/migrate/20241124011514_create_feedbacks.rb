class CreateFeedbacks < ActiveRecord::Migration[7.2]
  def change
    create_table :feedbacks do |t|
      t.integer :presentation_id
      t.integer :commentor_id
      t.text :comments
      t.integer :grades

      t.timestamps
    end
  end
end

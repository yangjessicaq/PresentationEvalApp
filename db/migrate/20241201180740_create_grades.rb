class CreateGrades < ActiveRecord::Migration[7.2]
  def change
    create_table :grades do |t|
      t.integer :grader_id, null: false
      t.string :grader_name, null: false
      t.integer :presentation_id, null: false
      t.integer :grade_value, null: false
      t.text :comments, null: false

      t.timestamps
    end

    add_foreign_key :grades, :users, column: :grader_id
    add_foreign_key :grades, :presentations
  end
end

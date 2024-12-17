# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_12_01_180740) do
  create_table "feedbacks", force: :cascade do |t|
    t.integer "presentation_id"
    t.integer "commentor_id"
    t.text "comments"
    t.integer "grades"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grader_id", null: false
    t.string "grader_name", null: false
    t.integer "presentation_id", null: false
    t.integer "grade_value", null: false
    t.text "comments", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.string "email1"
    t.string "email2"
    t.string "email3"
    t.string "email4"
    t.string "email5"
    t.string "topic"
    t.date "present_date"
    t.time "present_start_time"
    t.time "present_end_time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grades", "presentations"
  add_foreign_key "grades", "users", column: "grader_id"
end

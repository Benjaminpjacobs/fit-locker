# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170525144608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cardio_activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cardio_exercises", force: :cascade do |t|
    t.integer "duration"
    t.float "distance"
    t.bigint "cardio_activity_id"
    t.bigint "workout_id"
    t.index ["cardio_activity_id"], name: "index_cardio_exercises_on_cardio_activity_id"
    t.index ["workout_id"], name: "index_cardio_exercises_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "role", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "category"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "cardio_exercises", "cardio_activities"
  add_foreign_key "cardio_exercises", "workouts"
  add_foreign_key "workouts", "users"
end

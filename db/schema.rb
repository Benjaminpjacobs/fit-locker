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

ActiveRecord::Schema.define(version: 20170525185415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_muscle_groups", force: :cascade do |t|
    t.bigint "muscle_group_id"
    t.bigint "strength_activity_id"
    t.index ["muscle_group_id"], name: "index_activity_muscle_groups_on_muscle_group_id"
    t.index ["strength_activity_id"], name: "index_activity_muscle_groups_on_strength_activity_id"
  end

  create_table "cardio_activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cardio_exercises", force: :cascade do |t|
    t.string "duration"
    t.float "distance"
    t.bigint "cardio_activity_id"
    t.bigint "workout_id"
    t.index ["cardio_activity_id"], name: "index_cardio_exercises_on_cardio_activity_id"
    t.index ["workout_id"], name: "index_cardio_exercises_on_workout_id"
  end

  create_table "lift_sets", force: :cascade do |t|
    t.float "weight"
    t.integer "reps"
    t.bigint "strength_exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["strength_exercise_id"], name: "index_lift_sets_on_strength_exercise_id"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strength_activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strength_exercises", force: :cascade do |t|
    t.bigint "strength_activity_id"
    t.index ["strength_activity_id"], name: "index_strength_exercises_on_strength_activity_id"
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

  add_foreign_key "activity_muscle_groups", "muscle_groups"
  add_foreign_key "activity_muscle_groups", "strength_activities"
  add_foreign_key "cardio_exercises", "cardio_activities"
  add_foreign_key "cardio_exercises", "workouts"
  add_foreign_key "lift_sets", "strength_exercises"
  add_foreign_key "strength_exercises", "strength_activities"
  add_foreign_key "workouts", "users"
end

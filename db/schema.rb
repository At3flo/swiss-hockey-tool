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

ActiveRecord::Schema.define(version: 2019_06_23_153948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer "age"
    t.string "level"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.text "field_address"
    t.text "hall_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.integer "places_left"
    t.text "location"
    t.text "contact"
    t.boolean "is_tournament_open"
    t.boolean "is_outdoor"
    t.text "other_informations"
    t.bigint "club_id"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["club_id"], name: "index_events_on_club_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.string "team_name"
    t.bigint "event_id"
    t.bigint "club_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_inscriptions_on_category_id"
    t.index ["club_id"], name: "index_inscriptions_on_club_id"
    t.index ["event_id"], name: "index_inscriptions_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "role"
    t.bigint "club_id"
    t.index ["club_id"], name: "index_users_on_club_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "clubs"
  add_foreign_key "events", "users"
  add_foreign_key "inscriptions", "categories"
  add_foreign_key "inscriptions", "clubs"
  add_foreign_key "inscriptions", "events"
  add_foreign_key "users", "clubs"
end

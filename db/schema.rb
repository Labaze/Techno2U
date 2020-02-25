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

ActiveRecord::Schema.define(version: 2020_02_25_133222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "track_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "genre_id"
    t.index ["genre_id"], name: "index_artists_on_genre_id"
  end

  create_table "attendings", force: :cascade do |t|
    t.bigint "party_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_attendings_on_party_id"
    t.index ["user_id"], name: "index_attendings_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineups", force: :cascade do |t|
    t.bigint   "artist_id"
    t.bigint   "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index    ["artist_id"], name: "index_lineups_on_artist_id"
    t.index    ["party_id"], name: "index_lineups_on_party_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.datetime "begin"
    t.datetime "end"
    t.string   "venue_location"
    t.string   "venue_type"
    t.bigint   "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index    ["genre_id"], name: "index_parties_on_genre_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "genre_id"
    t.string "venue_type"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_preferences_on_artist_id"
    t.index ["genre_id"], name: "index_preferences_on_genre_id"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artists", "genres"
  add_foreign_key "attendings", "parties"
  add_foreign_key "attendings", "users"
  add_foreign_key "lineups", "artists"
  add_foreign_key "lineups", "parties"
  add_foreign_key "parties", "genres"
  add_foreign_key "preferences", "artists"
  add_foreign_key "preferences", "genres"
  add_foreign_key "preferences", "users"
end

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

ActiveRecord::Schema.define(version: 2020_03_02_093537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "track_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "genre_id"
    t.text "picture_url"
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
    t.bigint "artist_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_lineups_on_artist_id"
    t.index ["party_id"], name: "index_lineups_on_party_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "start_time"
    t.string "end_time"
    t.string "venue_location"
    t.string "venue_type"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "url"
    t.string "address"
    t.string "venue_name"
    t.text "image_url"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.text "facebook_link"
    t.index ["genre_id"], name: "index_parties_on_genre_id"
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
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
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

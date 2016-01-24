# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160123095513) do

  create_table "courtship_preferences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.boolean  "is_favourite"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "profile_courtship_preferences", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "courtship_preference_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "profile_courtship_preferences", ["courtship_preference_id"], name: "index_profile_courtship_preferences_on_courtship_preference_id"
  add_index "profile_courtship_preferences", ["profile_id"], name: "index_profile_courtship_preferences_on_profile_id"

  create_table "profile_photos", force: :cascade do |t|
    t.integer  "profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "is_profile_pic"
  end

  create_table "profile_views", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "age"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.date     "dob"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "gender"
    t.string   "religion"
    t.string   "ethnicity"
    t.string   "language"
    t.string   "occupation"
    t.string   "income"
    t.string   "household"
    t.string   "height"
    t.string   "weight"
    t.string   "bodytype"
    t.string   "smoker"
    t.string   "drinker"
    t.string   "status"
    t.string   "children"
    t.string   "wantkids"
    t.string   "selfbio"
    t.string   "ideal"
    t.boolean  "tandc"
    t.integer  "user_id"
    t.text     "expectations"
    t.string   "profile_heading"
    t.string   "education"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

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

ActiveRecord::Schema[7.2].define(version: 2024_12_06_122705) do
  create_table "communities", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_comments", force: :cascade do |t|
    t.text "body"
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["event_id"], name: "index_e_comments_on_event_id"
    t.index ["user_id"], name: "index_e_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_image"
    t.integer "community_id"
    t.integer "user_id"
    t.boolean "public", default: false
    t.index ["community_id"], name: "index_events_on_community_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "meet_id", null: false
    t.integer "user_id", null: false
    t.index ["meet_id"], name: "index_m_comments_on_meet_id"
    t.index ["user_id"], name: "index_m_comments_on_user_id"
  end

  create_table "mailers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meets", force: :cascade do |t|
    t.text "body"
    t.datetime "date_hosted"
    t.string "geotag"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meets_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "contact"
    t.string "avatar"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.integer "faculty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_programs_on_faculty_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "e_comments", "events"
  add_foreign_key "e_comments", "users"
  add_foreign_key "events", "communities"
  add_foreign_key "m_comments", "meets"
  add_foreign_key "m_comments", "users"
  add_foreign_key "meets", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "programs", "faculties"
end

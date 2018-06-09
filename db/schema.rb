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

ActiveRecord::Schema.define(version: 2018_06_09_191908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "health_attributes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "target_type_id"
    t.index ["target_type_id"], name: "index_health_attributes_on_target_type_id"
  end

  create_table "health_rating_standards", force: :cascade do |t|
    t.string "rating"
    t.string "description"
    t.float "value"
    t.string "weight"
    t.string "float"
    t.boolean "locked", default: false, null: false
  end

  create_table "health_ratings", force: :cascade do |t|
    t.string "rating"
    t.string "description"
    t.float "value"
    t.string "weight"
    t.string "float"
    t.boolean "locked", default: false, null: false
    t.bigint "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_id"], name: "index_health_ratings_on_target_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_id"
  end

  create_table "targets", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_type_id"
    t.index ["project_id"], name: "index_targets_on_project_id"
    t.index ["target_type_id"], name: "index_targets_on_target_type_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.date "due_on"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "health_attributes", "target_types"
  add_foreign_key "target_types", "targets"
  add_foreign_key "targets", "projects"
end

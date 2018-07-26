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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_07_16_028340) do
=======
ActiveRecord::Schema.define(version: 2018_07_20_171915) do
>>>>>>> master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "default_health_attributes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "target_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_default_health_attributes_on_created_by_id"
    t.index ["target_type_id"], name: "index_default_health_attributes_on_target_type_id"
    t.index ["updated_by_id"], name: "index_default_health_attributes_on_updated_by_id"
  end

  create_table "default_health_ratings", force: :cascade do |t|
    t.string "description"
    t.string "author_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "default_health_attribute_id"
    t.bigint "health_rating_type_id"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_default_health_ratings_on_created_by_id"
    t.index ["default_health_attribute_id"], name: "index_default_health_ratings_on_default_health_attribute_id"
    t.index ["health_rating_type_id"], name: "index_default_health_ratings_on_health_rating_type_id"
    t.index ["updated_by_id"], name: "index_default_health_ratings_on_updated_by_id"
  end

  create_table "health_assessments", force: :cascade do |t|
    t.text "notes"
    t.string "assessment_type"
    t.boolean "locked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "health_rating_id"
    t.bigint "health_attribute_id", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_health_assessments_on_created_by_id"
    t.index ["health_attribute_id"], name: "index_health_assessments_on_health_attribute_id"
    t.index ["health_rating_id"], name: "index_health_assessments_on_health_rating_id"
    t.index ["updated_by_id"], name: "index_health_assessments_on_updated_by_id"
  end

  create_table "health_attributes", force: :cascade do |t|
    t.bigint "default_health_attributes_id"
    t.bigint "target_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_health_attributes_on_created_by_id"
    t.index ["default_health_attributes_id"], name: "index_health_attributes_on_default_health_attributes_id"
    t.index ["target_id"], name: "index_health_attributes_on_target_id"
    t.index ["updated_by_id"], name: "index_health_attributes_on_updated_by_id"
  end

  create_table "health_rating_types", force: :cascade do |t|
    t.string "name"
    t.float "score"
    t.float "weight"
    t.float "threshold_min"
    t.float "threshold_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_health_rating_types_on_created_by_id"
    t.index ["updated_by_id"], name: "index_health_rating_types_on_updated_by_id"
  end

  create_table "health_ratings", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "default_health_rating_id"
    t.bigint "health_attribute_id"
    t.bigint "health_rating_type_id"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_health_ratings_on_created_by_id"
    t.index ["default_health_rating_id"], name: "index_health_ratings_on_default_health_rating_id"
    t.index ["health_attribute_id"], name: "index_health_ratings_on_health_attribute_id"
    t.index ["health_rating_type_id"], name: "index_health_ratings_on_health_rating_type_id"
    t.index ["updated_by_id"], name: "index_health_ratings_on_updated_by_id"
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
    t.string "description"
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
    t.string "status"
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
<<<<<<< HEAD
    t.bigint "project_id"
=======
    t.boolean "admin", default: false
>>>>>>> master
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["project_id"], name: "index_users_on_project_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "default_health_attributes", "target_types"
  add_foreign_key "default_health_ratings", "default_health_attributes"
  add_foreign_key "default_health_ratings", "health_rating_types"
  add_foreign_key "health_assessments", "health_attributes"
  add_foreign_key "health_assessments", "health_ratings"
  add_foreign_key "health_attributes", "default_health_attributes", column: "default_health_attributes_id"
  add_foreign_key "health_attributes", "targets"
  add_foreign_key "health_ratings", "default_health_ratings"
  add_foreign_key "health_ratings", "health_attributes"
  add_foreign_key "health_ratings", "health_rating_types"
  add_foreign_key "targets", "projects"
  add_foreign_key "users", "projects"
end

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

ActiveRecord::Schema[7.0].define(version: 2023_09_14_192020) do
  create_table "animation_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "animation_id"
    t.text "staffs"
    t.text "casts"
    t.integer "syobocal_tid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.integer "season"
    t.string "image"
    t.string "twitter_username"
    t.string "official_site_url"
    t.string "media_text"
    t.string "season_name_text"
    t.integer "syobocal_tid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bookmarks_count", default: 0, null: false
    t.float "tier_average", default: 0.0
  end

  create_table "bookmarks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "animation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animation_id", "user_id"], name: "index_bookmarks_on_animation_id_and_user_id", unique: true
    t.index ["animation_id"], name: "index_bookmarks_on_animation_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "relationships", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tier_list_entiers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "tier_score", null: false
    t.text "comment"
    t.boolean "spoiler", null: false
    t.bigint "animation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animation_id"], name: "index_tier_list_entiers_on_animation_id"
    t.index ["user_id"], name: "index_tier_list_entiers_on_user_id"
  end

  create_table "tier_lists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "animation_id", null: false
    t.bigint "user_id", null: false
    t.integer "tier_score", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "spoiler", null: false
    t.index ["animation_id"], name: "index_tier_lists_on_animation_id"
    t.index ["user_id"], name: "index_tier_lists_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name", null: false
    t.string "user_id", null: false
    t.string "user_image"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "header_image"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

  add_foreign_key "bookmarks", "animations"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "tier_list_entiers", "animations"
  add_foreign_key "tier_list_entiers", "users"
  add_foreign_key "tier_lists", "animations"
  add_foreign_key "tier_lists", "users"
end

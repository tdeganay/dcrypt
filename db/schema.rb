# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_24_133801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "key_figures_blocks", force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_key_figures_blocks_on_dashboard_id"
  end

  create_table "news_blocks", force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_news_blocks_on_dashboard_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "twitter_block_id", null: false
    t.string "text"
    t.string "user"
    t.string "username"
    t.string "url"
    t.string "image_url"
    t.date "created_on"
    t.string "profile_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["twitter_block_id"], name: "index_tweets_on_twitter_block_id"
  end

  create_table "twitter_blocks", force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_twitter_blocks_on_dashboard_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dashboards", "users"
  add_foreign_key "key_figures_blocks", "dashboards"
  add_foreign_key "news_blocks", "dashboards"
  add_foreign_key "tweets", "twitter_blocks"
  add_foreign_key "twitter_blocks", "dashboards"
end

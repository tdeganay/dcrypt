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

ActiveRecord::Schema.define(version: 2021_11_29_155526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.bigint "news_block_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "description"
    t.string "author"
    t.string "url"
    t.string "image_url"
    t.string "published_at"
    t.string "text"
    t.index ["news_block_id"], name: "index_articles_on_news_block_id"
  end

  create_table "dashboards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "key_figures_blocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messari_blocks", force: :cascade do |t|
    t.string "user_string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news_blocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_string"
  end

  create_table "plotables", force: :cascade do |t|
    t.string "title"
    t.string "username"
    t.float "value"
    t.date "current_date"
    t.bigint "messari_block_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["messari_block_id"], name: "index_plotables_on_messari_block_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "block_type", null: false
    t.bigint "block_id", null: false
    t.bigint "dashboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_type", "block_id"], name: "index_positions_on_block_type_and_block_id"
    t.index ["dashboard_id"], name: "index_positions_on_dashboard_id"
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
    t.string "tweet_id"
    t.index ["twitter_block_id"], name: "index_tweets_on_twitter_block_id"
  end

  create_table "twitter_blocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_string"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "news_blocks"
  add_foreign_key "dashboards", "users"
  add_foreign_key "plotables", "messari_blocks"
  add_foreign_key "positions", "dashboards"
  add_foreign_key "tweets", "twitter_blocks"
end

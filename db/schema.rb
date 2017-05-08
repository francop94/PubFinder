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

ActiveRecord::Schema.define(version: 20170508104911) do

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_answers_on_review_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "favorite_pubs", force: :cascade do |t|
    t.integer  "pub_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "pub_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pub_id", "created_at"], name: "index_microposts_on_pub_id_and_created_at"
    t.index ["pub_id"], name: "index_microposts_on_pub_id"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "pubs", force: :cascade do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["user_id", "created_at"], name: "index_pubs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_pubs_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "pub_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pub_id"], name: "index_reviews_on_pub_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visited_pubs", force: :cascade do |t|
    t.integer  "pub_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

ActiveRecord::Schema.define(version: 20150430163806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 100
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rarity_id"
    t.string "card_type"
    t.string "faction"
    t.string "text"
    t.string "mechanics"
    t.string "flavour"
    t.string "artist"
    t.integer "attack"
    t.integer "health"
    t.boolean "collectible", default: false
    t.boolean "elite"
    t.integer "durability"
    t.string "how_to_get_gold"
    t.string "json_id", limit: 100
    t.integer "player_class_id"
    t.integer "card_set_id", null: false
    t.string "race"
  end

  add_index "cards", ["json_id"], name: "index_cards_on_json_id", unique: true, using: :btree
  add_index "cards", ["rarity_id"], name: "index_cards_on_rarity_id", using: :btree

  create_table "player_classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "hero"
    t.string "colour"
    t.string "hexcolour", limit: 7
  end

  create_table "rarities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "colour"
    t.string "hexcolour"
    t.integer "craft_cost"
    t.integer "disenchant_reward"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

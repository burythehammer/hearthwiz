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

ActiveRecord::Schema.define(version: 20150310094914) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "rarity_id"
    t.string   "card_type"
    t.string   "faction"
    t.string   "text"
    t.string   "mechanics"
    t.string   "flavour"
    t.string   "artist"
    t.integer  "attack"
    t.integer  "health"
    t.boolean  "collectible"
    t.string   "json_id"
    t.boolean  "elite"
    t.integer  "durability"
    t.string   "how_to_get_gold"
  end

  add_index "cards", ["rarity_id"], name: "index_cards_on_rarity_id"

  create_table "rarities", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "colour"
    t.string   "hexcolour"
    t.integer  "craft_cost"
    t.integer  "disenchant_reward"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

end

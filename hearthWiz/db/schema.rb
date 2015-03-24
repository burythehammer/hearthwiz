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

ActiveRecord::Schema.define(version: 20150324174804) do

  create_table "card_sets", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 100
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "cost",            limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "rarity_id",       limit: 4
    t.string   "card_type",       limit: 255
    t.string   "faction",         limit: 255
    t.string   "text",            limit: 255
    t.string   "mechanics",       limit: 255
    t.string   "flavour",         limit: 255
    t.string   "artist",          limit: 255
    t.integer  "attack",          limit: 4
    t.integer  "health",          limit: 4
    t.boolean  "collectible",     limit: 1,   default: false
    t.boolean  "elite",           limit: 1
    t.integer  "durability",      limit: 4
    t.string   "how_to_get_gold", limit: 255
    t.string   "json_id",         limit: 100
    t.integer  "player_class_id", limit: 4
    t.integer  "card_set_id",     limit: 4,                   null: false
  end

  add_index "cards", ["json_id"], name: "index_cards_on_json_id", unique: true, using: :btree
  add_index "cards", ["rarity_id"], name: "index_cards_on_rarity_id", using: :btree

  create_table "player_classes", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "hero",       limit: 255
    t.string   "colour",     limit: 255
    t.string   "hexcolour",  limit: 7
  end

  create_table "rarities", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name",              limit: 255
    t.string   "colour",            limit: 255
    t.string   "hexcolour",         limit: 255
    t.integer  "craft_cost",        limit: 4
    t.integer  "disenchant_reward", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "bio",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "email",      limit: 255
  end

end

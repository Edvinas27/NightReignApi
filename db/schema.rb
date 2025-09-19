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

ActiveRecord::Schema[8.0].define(version: 2025_09_19_145702) do
  create_table "qualities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_attack_stats", force: :cascade do |t|
    t.integer "weapon_id", null: false
    t.string "stat_type"
    t.integer "value", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weapon_id"], name: "index_weapon_attack_stats_on_weapon_id"
  end

  create_table "weapon_guard_stats", force: :cascade do |t|
    t.integer "weapon_id", null: false
    t.string "stat_type"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weapon_id"], name: "index_weapon_guard_stats_on_weapon_id"
  end

  create_table "weapon_types", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quality_id", null: false
    t.integer "level_requirement", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weapon_type_id", null: false
    t.index ["quality_id"], name: "index_weapons_on_quality_id"
    t.index ["weapon_type_id"], name: "index_weapons_on_weapon_type_id"
  end

  add_foreign_key "weapon_attack_stats", "weapons"
  add_foreign_key "weapon_guard_stats", "weapons"
  add_foreign_key "weapons", "qualities"
  add_foreign_key "weapons", "weapon_types"
end

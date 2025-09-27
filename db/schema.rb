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

ActiveRecord::Schema[8.0].define(version: 2025_09_20_130054) do
  create_schema "auth"
  create_schema "dev"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "pgbouncer"
  create_schema "prod"
  create_schema "realtime"
  create_schema "storage"
  create_schema "test"
  create_schema "vault"

  # These are extensions that must be enabled in order to support this database
  enable_extension "extensions.pg_stat_statements"
  enable_extension "extensions.pgcrypto"
  enable_extension "extensions.uuid-ossp"
  enable_extension "graphql.pg_graphql"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "vault.supabase_vault"

  create_table "qualities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_types", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name", null: false
    t.integer "level_requirement", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quality_id", null: false
    t.bigint "weapon_type_id", null: false
    t.jsonb "stats", default: {}, null: false
    t.index ["quality_id"], name: "index_weapons_on_quality_id"
    t.index ["weapon_type_id"], name: "index_weapons_on_weapon_type_id"
  end

  add_foreign_key "weapons", "qualities"
  add_foreign_key "weapons", "weapon_types"
end

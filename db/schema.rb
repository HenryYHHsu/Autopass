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

ActiveRecord::Schema.define(version: 2020_02_20_041806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_conditions", force: :cascade do |t|
    t.boolean "limit", default: false
    t.integer "limitcash", default: 0
    t.bigint "active_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "target", default: 0
    t.integer "condition_type", default: 0
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.index ["active_id"], name: "index_active_conditions_on_active_id"
  end

  create_table "active_contents", force: :cascade do |t|
    t.integer "type"
    t.integer "discount_way"
    t.integer "target"
    t.integer "store_id"
    t.integer "product_id"
    t.bigint "active_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "discountvalue"
    t.index ["active_id"], name: "index_active_contents_on_active_id"
  end

  create_table "actives", force: :cascade do |t|
    t.string "name"
    t.boolean "a_status", default: false
    t.boolean "a_type", default: false
    t.integer "a_target", default: 0
    t.integer "a_limit", default: 0
    t.boolean "b_status", default: false
    t.boolean "b_type", default: false
    t.integer "b_target", default: 0
    t.integer "b_limit", default: 0
    t.boolean "c_status", default: false
    t.time "c_start"
    t.time "c_end"
    t.boolean "d_status", default: false
    t.string "d_target"
    t.boolean "e_status", default: false
    t.integer "e_target"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_conditions", "actives"
  add_foreign_key "active_contents", "actives"
end

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

ActiveRecord::Schema.define(version: 2021_04_23_063336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state"], name: "index_cities_on_state"
  end

  create_table "hospital_beds", force: :cascade do |t|
    t.string "hospital_name", null: false
    t.string "contact_name"
    t.string "phone", null: false
    t.string "alternate_phone"
    t.string "address", null: false
    t.bigint "city_id", null: false
    t.integer "icu_beds", null: false
    t.integer "beds", null: false
    t.boolean "unavailable", default: false, null: false
    t.boolean "fake", default: false, null: false
    t.boolean "old", default: false, null: false
    t.datetime "last_verified_at"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "disclaimer", default: false
    t.index ["city_id"], name: "index_hospital_beds_on_city_id"
  end

  create_table "oxygen_suppliers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "alternate_phone"
    t.bigint "city_id", null: false
    t.boolean "unavailable", default: false, null: false
    t.boolean "fake", default: false, null: false
    t.boolean "old", default: false, null: false
    t.datetime "last_verified_at"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "disclaimer", default: false
    t.index ["city_id"], name: "index_oxygen_suppliers_on_city_id"
  end

  create_table "plasma_donors", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "alternate_phone"
    t.integer "blood_group", null: false
    t.bigint "city_id", null: false
    t.integer "pincode"
    t.datetime "last_verified_at"
    t.boolean "unavailable", default: false, null: false
    t.boolean "fake", default: false, null: false
    t.boolean "old", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "covid_cured_at"
    t.boolean "disclaimer", default: false
    t.index ["city_id"], name: "index_plasma_donors_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_volunteers_on_city_id"
  end

  add_foreign_key "hospital_beds", "cities"
  add_foreign_key "oxygen_suppliers", "cities"
  add_foreign_key "plasma_donors", "cities"
  add_foreign_key "volunteers", "cities"
end

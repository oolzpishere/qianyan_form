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

ActiveRecord::Schema.define(version: 20170904173854) do

  create_table "primary_english_results", force: :cascade do |t|
    t.integer "result_id"
    t.string "openid"
    t.string "form"
    t.string "form_name"
    t.text "entry"
    t.string "gen_code"
    t.datetime "form_created_at"
    t.datetime "form_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form"], name: "index_primary_english_results_on_form"
    t.index ["gen_code"], name: "index_primary_english_results_on_gen_code"
    t.index ["openid"], name: "index_primary_english_results_on_openid"
    t.index ["result_id"], name: "index_primary_english_results_on_result_id"
  end

  create_table "primary_math_results", force: :cascade do |t|
    t.integer "result_id"
    t.string "openid"
    t.string "form"
    t.string "form_name"
    t.text "entry"
    t.string "gen_code"
    t.datetime "form_created_at"
    t.datetime "form_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form"], name: "index_primary_math_results_on_form"
    t.index ["gen_code"], name: "index_primary_math_results_on_gen_code"
    t.index ["openid"], name: "index_primary_math_results_on_openid"
    t.index ["result_id"], name: "index_primary_math_results_on_result_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "subject"
    t.datetime "form_created_at"
    t.datetime "form_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

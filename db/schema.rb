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

ActiveRecord::Schema.define(version: 20160507233528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "meetup_title"
    t.string   "meetup_url"
    t.string   "location"
    t.string   "time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "overview"
    t.integer  "employee_count"
    t.integer  "tech_team_size"
    t.string   "website"
    t.string   "twitter"
    t.boolean  "published",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
  end

  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",                             default: false
    t.boolean  "activated",                         default: false
    t.string   "account_verification_token"
    t.datetime "account_verification_requested_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_requested_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "organization_id"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

  add_foreign_key "organizations", "users"
  add_foreign_key "users", "organizations"
end

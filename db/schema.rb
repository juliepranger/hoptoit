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

ActiveRecord::Schema.define(version: 20131121202550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charity_verifiers", force: true do |t|
    t.integer  "ein"
    t.string   "org_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "in_care_of_name"
    t.integer  "subsection_code"
    t.integer  "classification_code"
    t.integer  "affiliation_code"
    t.integer  "deductability_code"
    t.integer  "foundation_code"
    t.integer  "eo_status_code"
    t.integer  "income_code"
    t.integer  "tax_period"
    t.string   "secondary_name"
    t.string   "ntee_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  create_table "issues", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "funding_goal"
    t.integer  "pledged_total"
    t.integer  "num_backers"
    t.datetime "funding_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.string   "creator_type"
    t.integer  "organization_id"
  end

  create_table "issues_organizations", force: true do |t|
    t.integer "issue_id"
    t.integer "organization_id"
  end

  create_table "ntee_codes", force: true do |t|
    t.string   "common_code"
    t.string   "core_code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "organization_name"
    t.integer  "ein"
    t.integer  "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "description"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.string   "creator_type"
  end

  create_table "organizations_users", force: true do |t|
    t.integer "organization_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "admin"
  end

end

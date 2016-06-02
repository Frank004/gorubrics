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

ActiveRecord::Schema.define(version: 20151123130247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "categories", ["organization_id"], name: "index_categories_on_organization_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.string   "series"
    t.string   "category"
    t.integer  "participant_id"
    t.integer  "event_id"
    t.integer  "organization_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "characters", ["event_id"], name: "index_characters_on_event_id", using: :btree
  add_index "characters", ["organization_id"], name: "index_characters_on_organization_id", using: :btree
  add_index "characters", ["participant_id"], name: "index_characters_on_participant_id", using: :btree

  create_table "criterions", force: :cascade do |t|
    t.string   "name"
    t.integer  "evaluation_builder_id"
    t.integer  "organization_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "criterions", ["evaluation_builder_id"], name: "index_criterions_on_evaluation_builder_id", using: :btree
  add_index "criterions", ["organization_id"], name: "index_criterions_on_organization_id", using: :btree

  create_table "evaluation_builders", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.integer  "organization_id"
    t.integer  "category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "evaluation_builders", ["category_id"], name: "index_evaluation_builders_on_category_id", using: :btree
  add_index "evaluation_builders", ["event_id"], name: "index_evaluation_builders_on_event_id", using: :btree
  add_index "evaluation_builders", ["organization_id"], name: "index_evaluation_builders_on_organization_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.text     "note"
    t.integer  "total_score"
    t.integer  "participant_id"
    t.integer  "member_id"
    t.integer  "evaluation_builder_id"
    t.integer  "event_id"
    t.integer  "organization_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "evaluations", ["evaluation_builder_id"], name: "index_evaluations_on_evaluation_builder_id", using: :btree
  add_index "evaluations", ["event_id"], name: "index_evaluations_on_event_id", using: :btree
  add_index "evaluations", ["member_id"], name: "index_evaluations_on_member_id", using: :btree
  add_index "evaluations", ["organization_id"], name: "index_evaluations_on_organization_id", using: :btree
  add_index "evaluations", ["participant_id"], name: "index_evaluations_on_participant_id", using: :btree

  create_table "event_members", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_members", ["event_id"], name: "index_event_members_on_event_id", using: :btree
  add_index "event_members", ["member_id"], name: "index_event_members_on_member_id", using: :btree

  create_table "event_sponsors", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_sponsors", ["event_id"], name: "index_event_sponsors_on_event_id", using: :btree
  add_index "event_sponsors", ["sponsor_id"], name: "index_event_sponsors_on_sponsor_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "place"
    t.string   "city"
    t.string   "country"
    t.integer  "organization_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "status",            default: false
  end

  add_index "events", ["organization_id"], name: "index_events_on_organization_id", using: :btree

  create_table "member_roles", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "member_roles", ["member_id"], name: "index_member_roles_on_member_id", using: :btree
  add_index "member_roles", ["role_id"], name: "index_member_roles_on_role_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.integer  "organization_id"
    t.boolean  "gender",                 default: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "city"
    t.string   "country"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "participants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.string   "event_id"
    t.integer  "organization_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "participants", ["organization_id"], name: "index_participants_on_organization_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.integer  "criterion_value"
    t.integer  "evaluation_id"
    t.integer  "event_id"
    t.integer  "organization_id"
    t.integer  "criterion_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "points", ["criterion_id"], name: "index_points_on_criterion_id", using: :btree
  add_index "points", ["evaluation_id"], name: "index_points_on_evaluation_id", using: :btree
  add_index "points", ["event_id"], name: "index_points_on_event_id", using: :btree
  add_index "points", ["organization_id"], name: "index_points_on_organization_id", using: :btree

  create_table "promos", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "event_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "promos", ["event_id"], name: "index_promos_on_event_id", using: :btree
  add_index "promos", ["organization_id"], name: "index_promos_on_organization_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "overall_score"
    t.integer  "participant_id"
    t.integer  "event_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "scores", ["event_id"], name: "index_scores_on_event_id", using: :btree
  add_index "scores", ["organization_id"], name: "index_scores_on_organization_id", using: :btree
  add_index "scores", ["participant_id"], name: "index_scores_on_participant_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "priority"
    t.string   "contribution"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_foreign_key "categories", "organizations"
  add_foreign_key "characters", "events"
  add_foreign_key "characters", "organizations"
  add_foreign_key "characters", "participants"
  add_foreign_key "criterions", "evaluation_builders"
  add_foreign_key "criterions", "organizations"
  add_foreign_key "evaluation_builders", "categories"
  add_foreign_key "evaluation_builders", "events"
  add_foreign_key "evaluation_builders", "organizations"
  add_foreign_key "evaluations", "evaluation_builders"
  add_foreign_key "evaluations", "events"
  add_foreign_key "evaluations", "members"
  add_foreign_key "evaluations", "organizations"
  add_foreign_key "evaluations", "participants"
  add_foreign_key "event_members", "events"
  add_foreign_key "event_members", "members"
  add_foreign_key "event_sponsors", "events"
  add_foreign_key "event_sponsors", "sponsors"
  add_foreign_key "events", "organizations"
  add_foreign_key "member_roles", "members"
  add_foreign_key "member_roles", "roles"
  add_foreign_key "participants", "organizations"
  add_foreign_key "points", "criterions"
  add_foreign_key "points", "evaluations"
  add_foreign_key "points", "events"
  add_foreign_key "points", "organizations"
  add_foreign_key "promos", "events"
  add_foreign_key "promos", "organizations"
  add_foreign_key "scores", "events"
  add_foreign_key "scores", "organizations"
  add_foreign_key "scores", "participants"
end

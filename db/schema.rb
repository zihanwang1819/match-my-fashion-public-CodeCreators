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

ActiveRecord::Schema.define(version: 20170308000208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "general_infos", force: :cascade do |t|
    t.string   "userKey"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "month_ofbirth"
    t.integer  "day_ofbirth"
    t.integer  "year_ofbirth"
    t.string   "gender"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "compensation"
    t.string   "facebook_link"
    t.string   "linkedIn_link"
    t.string   "instagram_link"
    t.string   "personalWebsite_link"
    t.text     "bio"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "login_infos", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "userKey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specific_designers", force: :cascade do |t|
    t.text     "genre"
    t.text     "influencers"
    t.text     "specialties"
    t.string   "compensation"
    t.string   "experience"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "user_key"
  end

  create_table "specific_models", force: :cascade do |t|
    t.integer  "height_feet"
    t.integer  "height_inches"
    t.integer  "bust"
    t.integer  "waist"
    t.integer  "hips"
    t.string   "cups"
    t.integer  "shoe_size"
    t.integer  "dress_size"
    t.string   "hair_color"
    t.string   "eye_color"
    t.string   "ethnicity"
    t.string   "skin_color"
    t.string   "shoot_nudes"
    t.string   "tattoos"
    t.string   "piercings"
    t.string   "experience"
    t.text     "genre"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "user_key"
  end

  create_table "specific_photographers", force: :cascade do |t|
    t.string   "compensation"
    t.string   "experience"
    t.text     "influencers"
    t.text     "specialties"
    t.text     "genre"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "user_key"
  end

end

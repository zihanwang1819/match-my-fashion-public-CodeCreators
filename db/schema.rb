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

ActiveRecord::Schema.define(version: 2021_10_29_063303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "galleries", id: :serial, force: :cascade do |t|
    t.string "gallery_title"
    t.text "gallery_description"
    t.string "gallery_picture", array: true
    t.float "gallery_totalRate"
    t.integer "gallery_totalRator"
    t.integer "GeneralInfo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gallery"
  end

  create_table "general_infos", id: :serial, force: :cascade do |t|
    t.string "userKey"
    t.string "first_name"
    t.string "last_name"
    t.integer "month_ofbirth"
    t.integer "day_ofbirth"
    t.integer "year_ofbirth"
    t.string "gender"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "compensation"
    t.string "facebook_link"
    t.string "linkedIn_link"
    t.string "instagram_link"
    t.string "personalWebsite_link"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "specific_profile_id"
    t.string "profile_picture"
    t.string "cover_picture"
    t.string "gallery_pictures", array: true
    t.integer "template_id"
    t.json "specific_profile"
    t.string "phone"
    t.float "latitude"
    t.float "longitude"
    t.text "job_attr"
    t.string "job_name"
    t.boolean "is_admin"
    t.string "creators"
    t.string "services"
    t.string "makers"
  end

  create_table "login_infos", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "userKey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "is_admin"
  end

  create_table "models", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "specific_designers", id: :serial, force: :cascade do |t|
    t.text "genre"
    t.text "influencers"
    t.text "specialties"
    t.string "compensation"
    t.string "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_key"
  end

  create_table "specific_models", id: :serial, force: :cascade do |t|
    t.integer "height_feet"
    t.integer "height_inches"
    t.integer "bust"
    t.integer "waist"
    t.integer "hips"
    t.string "cups"
    t.integer "shoe_size"
    t.integer "dress_size"
    t.string "hair_color"
    t.string "eye_color"
    t.string "ethnicity"
    t.string "skin_color"
    t.string "shoot_nudes"
    t.string "tattoos"
    t.string "piercings"
    t.string "experience"
    t.text "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_key"
  end

  create_table "specific_photographers", id: :serial, force: :cascade do |t|
    t.string "compensation"
    t.string "experience"
    t.text "influencers"
    t.text "specialties"
    t.text "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_key"
    t.string "state"
  end

  create_table "templates", id: :serial, force: :cascade do |t|
    t.string "prof_name"
    t.json "prof_attribute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.string "password"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end

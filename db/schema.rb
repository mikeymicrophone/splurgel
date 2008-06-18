# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080615192902) do

  create_table "address_uses", :force => true do |t|
    t.string   "target_type"
    t.integer  "target_id"
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.string   "name"
    t.string   "alternate_names"
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "administrator_id"
    t.integer  "user_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "reply_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "address_id"
    t.integer  "card_number"
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.integer  "security_code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followings", :force => true do |t|
    t.integer  "target_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "target_type"
    t.string   "follower_type"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "administrator_id"
    t.integer  "group_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_uses", :force => true do |t|
    t.integer  "image_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "images", :force => true do |t|
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "listings", :force => true do |t|
    t.integer  "list_type"
    t.integer  "product_id"
    t.integer  "brand_id"
    t.integer  "store_id"
    t.integer  "user_id"
    t.integer  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "phone"
    t.integer  "store_id"
    t.integer  "schedule_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "reply_id"
    t.datetime "read_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipient_id"
  end

  create_table "network_memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "network_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "offerings", :force => true do |t|
    t.integer  "product_id"
    t.integer  "location_id"
    t.string   "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "prices", :force => true do |t|
    t.integer  "offering_id"
    t.boolean  "sale"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "offering_id"
    t.integer  "credit_card_id"
    t.integer  "address_id"
    t.boolean  "approved"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.time     "sunday_open"
    t.time     "sunday_close"
    t.time     "monday_open"
    t.time     "monday_close"
    t.time     "tuesday_open"
    t.time     "tuesday_close"
    t.time     "wednesday_open"
    t.time     "wednesday_close"
    t.time     "thursday_open"
    t.time     "thursday_close"
    t.time     "friday_open"
    t.time     "friday_close"
    t.time     "saturday_open"
    t.time     "saturday_close"
    t.boolean  "holidays"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.integer  "administrator_id"
    t.integer  "primary_image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.text     "interests"
    t.text     "hobbies"
    t.text     "persona"
    t.integer  "primary_address_id"
    t.string   "phone"
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "website_uses", :force => true do |t|
    t.string   "target_type"
    t.integer  "target_id"
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "websites", :force => true do |t|
    t.string   "href"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
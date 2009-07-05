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

ActiveRecord::Schema.define(:version => 20090705170553) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.string   "lang"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proverb_count", :default => 0
  end

  create_table "category_subscribers", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_subscribers", ["category_id"], :name => "index_category_subscribers_on_category_id"
  add_index "category_subscribers", ["user_id"], :name => "index_category_subscribers_on_user_id"

  create_table "facebook_templates", :force => true do |t|
    t.string "template_name", :null => false
    t.string "content_hash",  :null => false
    t.string "bundle_id"
  end

  add_index "facebook_templates", ["template_name"], :name => "index_facebook_templates_on_template_name", :unique => true

  create_table "proverb_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "score"
    t.integer  "proverb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proverb_words", :force => true do |t|
    t.string   "word"
    t.integer  "user_id"
    t.integer  "proverb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proverbs", :force => true do |t|
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer  "score"
    t.integer  "category_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "score",      :default => 0
  end

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120423030743) do

  create_table "pages", :force => true do |t|
    t.integer  "survey_id"
    t.string   "title"
    t.text     "description"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", :force => true do |t|
    t.text     "question"
    t.text     "answers_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "page_id"
    t.text     "text",         :default => "", :null => false
    t.text     "hint",         :default => "", :null => false
    t.string   "type",         :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "options_data"
    t.integer  "number"
  end

  create_table "responses", :force => true do |t|
    t.integer  "poll_id"
    t.integer  "user_id"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["poll_id"], :name => "index_responses_on_poll_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "site_contents", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "survey_responses", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.integer  "last_page",   :default => 0,     :null => false
    t.text     "answers",     :default => "",    :null => false
    t.boolean  "is_complete", :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "name",         :default => "",    :null => false
    t.boolean  "is_published", :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "before_text"
    t.text     "after_text"
  end

  create_table "users", :force => true do |t|
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "username",            :default => "",    :null => false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "needs_info",          :default => true,  :null => false
    t.string   "division"
    t.string   "year"
    t.string   "location"
    t.boolean  "is_admin",            :default => false, :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end

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

ActiveRecord::Schema.define(:version => 20110104234735) do

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.boolean "exposure",  :default => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "content"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_full_size"
  end

  create_table "tasks", :force => true do |t|
    t.string "name"
    t.date   "start_at"
    t.date   "end_at"
  end

  create_table "tasks_users", :id => false, :force => true do |t|
    t.integer "task_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "password_hash"
    t.string "password_salt"
  end

end

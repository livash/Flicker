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

ActiveRecord::Schema.define(:version => 20130903224131) do

  create_table "album_photos", :force => true do |t|
    t.integer  "album_id",   :null => false
    t.integer  "photo_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "album_photos", ["album_id"], :name => "index_album_photos_on_album_id"
  add_index "album_photos", ["photo_id"], :name => "index_album_photos_on_photo_id"

  create_table "albums", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "collection_albums", :force => true do |t|
    t.integer  "collection_id", :null => false
    t.integer  "album_id",      :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "collection_albums", ["album_id"], :name => "index_collection_albums_on_album_id"
  add_index "collection_albums", ["collection_id"], :name => "index_collection_albums_on_collection_id"

  create_table "collections", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "author_id",  :null => false
    t.integer  "photo_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"
  add_index "comments", ["photo_id"], :name => "index_comments_on_photo_id"

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gallery_photos", :force => true do |t|
    t.integer  "photo_id",   :null => false
    t.integer  "gallery_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "description"
    t.integer  "owner_id",           :null => false
    t.string   "title"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["owner_id"], :name => "index_photos_on_owner_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",     :null => false
    t.integer  "photo_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["photo_id"], :name => "index_taggings_on_photo_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "title"
    t.integer  "author_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["author_id"], :name => "index_tags_on_author_id"
  add_index "tags", ["title"], :name => "index_tags_on_title"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

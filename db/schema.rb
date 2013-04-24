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

ActiveRecord::Schema.define(:version => 20130424021201) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.string   "identifier", :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                          :null => false
    t.integer  "block_id"
    t.string   "label",                                            :null => false
    t.string   "file_file_name",                                   :null => false
    t.string   "file_content_type",                                :null => false
    t.integer  "file_file_size",                                   :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.text     "css",        :limit => 16777215
    t.text     "js",         :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                                               :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                                 :null => false
    t.string   "slug"
    t.string   "full_path",                                             :null => false
    t.text     "content",        :limit => 16777215
    t.integer  "position",                           :default => 0,     :null => false
    t.integer  "children_count",                     :default => 0,     :null => false
    t.boolean  "is_published",                       :default => true,  :null => false
    t.boolean  "is_shared",                          :default => false, :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type",                     :null => false
    t.integer  "record_id",                       :null => false
    t.text     "data",        :limit => 16777215
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

  create_table "financial_reports", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.boolean  "visible"
    t.text     "description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.boolean  "attendance_day_sunday"
    t.boolean  "attendance_day_monday"
    t.boolean  "attendance_day_tuesday"
    t.boolean  "attendance_day_wednesday"
    t.boolean  "attendance_day_thursday"
    t.boolean  "attendance_day_friday"
    t.boolean  "attendance_day_saturday"
    t.boolean  "show_attendance_days"
    t.integer  "frequency_value"
    t.string   "frequency_unit"
    t.boolean  "show_frequency"
    t.boolean  "attendance_shift_morning"
    t.boolean  "attendance_shift_afternoon"
    t.boolean  "attendance_shift_night"
    t.boolean  "show_attendance_shift"
    t.string   "attendance_goal_value"
    t.boolean  "show_attendance_goal"
    t.integer  "meals_quantity_value"
    t.string   "meals_quantity_unit"
    t.boolean  "show_meals_quantity"
    t.integer  "available_spots"
    t.boolean  "show_available_spots"
    t.string   "url"
  end

end

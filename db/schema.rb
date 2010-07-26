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

ActiveRecord::Schema.define(:version => 20100725222424) do

  create_table "colaborators", :force => true do |t|
    t.integer  "user_id"
    t.integer  "laptop_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "laptops", :force => true do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "color"
    t.text     "defecto"
    t.text     "comentarios"
    t.string   "usuario"
    t.string   "contra"
    t.integer  "estado",      :default => 0
    t.string   "paquete"
    t.boolean  "respaldo"
    t.integer  "user_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "terms"
    t.string   "so"
    t.boolean  "promo"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.datetime "publishedDate"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.boolean  "chrome"
    t.boolean  "firefox"
    t.boolean  "messenger"
    t.boolean  "skype"
    t.boolean  "itunes"
    t.boolean  "reader"
    t.boolean  "office",     :default => true
    t.boolean  "flash",      :default => true
    t.boolean  "avast",      :default => true
    t.boolean  "winrar"
    t.boolean  "java",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "laptop_id"
  end

  create_table "users", :force => true do |t|
    t.string   "fname"
    t.string   "crypted_password"
    t.string   "career"
    t.string   "email"
    t.string   "schoolid"
    t.string   "phone"
    t.string   "cel"
    t.string   "nextel"
    t.boolean  "admin"
    t.boolean  "colaborator"
    t.boolean  "client"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "lname"
  end

end

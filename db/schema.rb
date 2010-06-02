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

ActiveRecord::Schema.define(:version => 20100602024505) do

  create_table "laptops", :force => true do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "color"
    t.text     "defecto"
    t.text     "comentarios"
    t.string   "usuario"
    t.string   "contra"
    t.string   "estado"
    t.string   "paquete"
    t.boolean  "respaldo"
    t.integer  "user_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "encrypted_password"
    t.string   "carrer"
    t.string   "email"
    t.string   "matricula"
    t.string   "phone"
    t.string   "cel"
    t.string   "nextel"
    t.boolean  "admin"
    t.boolean  "colaborador"
    t.boolean  "cliente"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

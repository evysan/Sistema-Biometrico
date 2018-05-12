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

ActiveRecord::Schema.define(version: 2018_05_08_010327) do

  create_table "assistances", force: :cascade do |t|
    t.datetime "fecha_ingreso"
    t.datetime "fecha_egreso"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_assistances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firtsname"
    t.string "lastname"
    t.string "gender"
    t.string "phone"
    t.string "role"
    t.integer "identification"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "Inactivo"
    t.string "password"
  end

end

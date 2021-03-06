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

ActiveRecord::Schema.define(version: 5) do

  create_table "drinks", force: :cascade do |t|
    t.string "drink_name"
    t.string "sign"
    t.integer "api_id"
    t.string "instructions"
    t.string "alcoholic"
    t.string "category"
    t.integer "no_ingredients"
  end

  create_table "horoscopes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "drink_id"
    t.string "horoscope"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "ingredient_name"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "drink_id"
    t.integer "ingredient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "sign"
  end

end

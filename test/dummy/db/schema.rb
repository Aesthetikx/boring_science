# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_30_144744) do

  create_table "boring_science_articles", force: :cascade do |t|
    t.string "blog", null: false
    t.string "title", null: false
    t.string "summary"
    t.text "body", null: false
    t.date "publication_date"
    t.string "slug", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"author\"", name: "index_boring_science_articles_on_author"
    t.index ["author_type", "author_id"], name: "index_boring_science_articles_on_author_type_and_author_id"
    t.index ["blog"], name: "index_boring_science_articles_on_blog"
    t.index ["slug"], name: "index_boring_science_articles_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

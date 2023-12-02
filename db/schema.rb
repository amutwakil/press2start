# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_30_042831) do
  create_table "developers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_developers_on_name", unique: true
  end

  create_table "game_rating_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_game_rating_categories_on_name", unique: true
  end

  create_table "game_rating_combos", force: :cascade do |t|
    t.string "value", null: false
    t.integer "game_rating_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_rating_category_id"], name: "index_game_rating_combos_on_game_rating_category_id"
    t.index ["value"], name: "index_game_rating_combos_on_value", unique: true
  end

  create_table "game_ratings", force: :cascade do |t|
    t.integer "game_rating_combo_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_ratings_on_game_id"
    t.index ["game_rating_combo_id"], name: "index_game_ratings_on_game_rating_combo_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.integer "year", null: false
    t.text "review", null: false
    t.integer "genre_id", null: false
    t.integer "publisher_id", null: false
    t.integer "developer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "platform_id", null: false
    t.string "slug"
    t.index ["developer_id"], name: "index_games_on_developer_id"
    t.index ["genre_id"], name: "index_games_on_genre_id"
    t.index ["platform_id"], name: "index_games_on_platform_id"
    t.index ["publisher_id"], name: "index_games_on_publisher_id"
    t.index ["slug"], name: "index_games_on_slug", unique: true
    t.index ["title"], name: "index_games_on_title", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_platforms_on_name", unique: true
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_publishers_on_name", unique: true
  end

  add_foreign_key "game_rating_combos", "game_rating_categories"
  add_foreign_key "game_ratings", "game_rating_combos"
  add_foreign_key "game_ratings", "games"
  add_foreign_key "games", "developers"
  add_foreign_key "games", "genres"
  add_foreign_key "games", "platforms"
  add_foreign_key "games", "publishers"
end

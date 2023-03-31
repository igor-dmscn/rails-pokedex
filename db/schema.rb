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

ActiveRecord::Schema[7.0].define(version: 2023_03_31_190133) do
  create_table "pokedexes", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_pokedexes_on_trainer_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trainer_id", null: false
    t.integer "pokedex_id", null: false
    t.index ["pokedex_id"], name: "index_pokemons_on_pokedex_id"
    t.index ["trainer_id"], name: "index_pokemons_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "master_trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_trainer_id"], name: "index_trainers_on_master_trainer_id"
  end

  add_foreign_key "pokedexes", "trainers"
  add_foreign_key "pokemons", "pokedexes"
  add_foreign_key "pokemons", "trainers"
  add_foreign_key "trainers", "trainers", column: "master_trainer_id"
end

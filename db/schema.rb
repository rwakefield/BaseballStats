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

ActiveRecord::Schema.define(version: 20180905164716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "career_stats", force: :cascade do |t|
    t.decimal "batting_average",     precision: 10, scale: 3
    t.decimal "slugging_percentage", precision: 10, scale: 3
    t.integer "player_id"
    t.index ["player_id"], name: "index_career_stats_on_player_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "league_id"
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id", "league_id"], name: "index_organizations_on_team_id_and_league_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "birth_year"
    t.string   "identifier"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "imported",   default: false, null: false
    t.index ["identifier"], name: "index_players_on_identifier", unique: true, using: :btree
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id",   null: false
    t.index ["player_id", "team_id"], name: "index_players_teams_on_player_id_and_team_id", using: :btree
  end

  create_table "season_stats", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "stat_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id", "stat_id", "player_id"], name: "index_season_stats_on_season_id_and_stat_id_and_player_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer  "games"
    t.integer  "at_bats"
    t.integer  "runs_scored"
    t.integer  "hits"
    t.integer  "doubles"
    t.integer  "triples"
    t.integer  "home_runs"
    t.integer  "runs_batted_in"
    t.integer  "stolen_bases"
    t.integer  "times_caught_steeling"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "player_identifier"
    t.string   "season_identifier"
    t.string   "team_identifier"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

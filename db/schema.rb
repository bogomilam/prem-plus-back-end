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

ActiveRecord::Schema.define(version: 2020_01_10_111746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "club_stats", force: :cascade do |t|
    t.integer "club_id"
    t.integer "table_pos"
    t.integer "played_overall"
    t.integer "win_home"
    t.integer "win_away"
    t.integer "draw_home"
    t.integer "draw_away"
    t.integer "loss_home"
    t.integer "loss_away"
    t.integer "goals_home"
    t.integer "goals_away"
    t.integer "concede_home"
    t.integer "concede_away"
    t.integer "possessionAVG_overall"
    t.integer "cs_home"
    t.integer "cs_away"
    t.integer "fts_home"
    t.integer "fts_away"
    t.integer "btts_home"
    t.integer "btts_away"
    t.float "ppg_home"
    t.float "ppg_away"
    t.integer "win_p_home"
    t.integer "win_p_away"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.integer "club_id"
    t.integer "competition_id"
    t.string "name"
    t.string "shorthand"
    t.string "image"
    t.integer "founded"
    t.string "country"
    t.integer "average_attendance_home"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.integer "league_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_id"
    t.integer "away_id"
    t.integer "home_goal_count"
    t.integer "away_goal_count"
    t.string "stadium_name"
    t.integer "date"
    t.integer "attendance"
    t.string "status"
    t.integer "fs_match_id"
    t.integer "competition_id"
    t.integer "game_week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

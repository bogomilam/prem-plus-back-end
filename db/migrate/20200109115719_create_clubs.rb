class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.integer :competition_id
      t.string :name
      t.string :shorthand
      t.string :image
      t.integer :founded
      t.string :country
      t.integer :average_attendance_home


      t.integer :table_pos
      t.integer :played_overall
      t.integer :win_home
      t.integer :win_away
      t.integer :draw_home
      t.integer :draw_away
      t.integer :loss_home
      t.integer :loss_away
      t.integer :goals_home
      t.integer :goals_away
      t.integer :concede_home
      t.integer :concede_away
      t.integer :possessionAVG_overall
      t.integer :cs_home
      t.integer :cs_away
      t.integer :fts_home
      t.integer :fts_away
      t.integer :btts_home
      t.integer :btts_away
      t.float :ppg_home
      t.float :ppg_away
      t.integer :win_p_home
      t.integer :win_p_away




      t.timestamps
    end
  end
end

class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|

      t.integer :home_id
      t.integer :away_id
      t.integer :home_goal_count
      t.integer :away_goal_count
      t.string :stadium_name
      t.integer :date
      t.integer :attendance
      t.string :status
      t.integer :fs_match_id
      t.integer :competition_id
      t.integer :game_week

      t.timestamps
    end
  end
end

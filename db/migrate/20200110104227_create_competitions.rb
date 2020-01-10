class CreateCompetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :competitions do |t|

     t.string :name
     t.integer :league_id

      t.timestamps
    end
  end
end

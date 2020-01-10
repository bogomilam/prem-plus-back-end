class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.integer :club_id
      t.integer :competition_id
      t.string :name
      t.string :shorthand
      t.string :image
      t.integer :founded
      t.string :country
      t.integer :average_attendance_home

      t.timestamps
    end
  end
end

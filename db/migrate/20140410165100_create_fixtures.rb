class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :gameweek
      t.string :location
      t.integer :team_1
      t.integer :team_2
      t.integer :team_1_score
      t.integer :team_2_score
      t.integer :competition_id

      t.timestamps
    end
  end
end

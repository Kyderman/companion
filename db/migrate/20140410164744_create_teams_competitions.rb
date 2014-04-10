class CreateTeamsCompetitions < ActiveRecord::Migration
  def change
    create_table :teams_competitions do |t|
      t.integer :team_id
      t.integer :competition_id

      t.timestamps
    end
  end
end

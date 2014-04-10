class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :sport
      t.integer :owner

      t.timestamps
    end
  end
end

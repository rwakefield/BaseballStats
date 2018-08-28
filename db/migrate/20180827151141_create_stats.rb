class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
      t.integer :games
      t.integer :at_bats
      t.integer :runs_scored
      t.integer :hits
      t.integer :doubles
      t.integer :triples
      t.integer :home_runs
      t.integer :runs_batted_in
      t.integer :stolen_bases
      t.integer :times_caught_steeling
      t.timestamps
    end
  end
end

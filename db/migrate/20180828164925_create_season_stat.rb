class CreateSeasonStat < ActiveRecord::Migration[5.0]
  def change
    create_table :season_stats do |t|
      t.integer :season_id
      t.integer :stat_id
      t.integer :player_id

      t.timestamps
    end

    add_index :season_stats, [:season_id, :stat_id, :player_id]
  end
end

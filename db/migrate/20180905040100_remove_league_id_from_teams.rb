class RemoveLeagueIdFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_index :teams, :league_id
    remove_column :teams, :league_id
  end
end

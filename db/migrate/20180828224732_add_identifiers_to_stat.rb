class AddIdentifiersToStat < ActiveRecord::Migration[5.0]
  def change
    add_column :stats, :player_identifier, :string
    add_column :stats, :season_identifier, :string
    add_column :stats, :team_identifier, :string
  end
end

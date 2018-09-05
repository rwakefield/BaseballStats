require 'test_helper'

describe 'PlayerDestroyer' do
  describe '#destroy_all_players' do
    it 'will destroy all players where imported is true' do
      non_imported_player = create :player, :sequence_identifier
      create :player, :sequence_identifier, :imported
      create :player, :sequence_identifier, :imported
      Player.count.must_equal 3
      PlayerDestroyer.destroy_all_players
      Player.count.must_equal 1
      player = Player.first
      player.must_equal non_imported_player
      player.imported.must_equal false
    end

    it 'will destroy all other data' do
      create :organization
      create :season_stat

      League.count.must_equal 1
      Organization.count.must_equal 1
      Player.count.must_equal 1
      Season.count.must_equal 1
      SeasonStat.count.must_equal 1
      Stat.count.must_equal 1
      Team.count.must_equal 1

      PlayerDestroyer.destroy_all_players

      League.count.must_equal 0
      Organization.count.must_equal 0
      Player.count.must_equal 1
      Season.count.must_equal 0
      SeasonStat.count.must_equal 0
      Stat.count.must_equal 0
      Team.count.must_equal 0
    end
  end

  describe '#destroy_empty_players' do
    it 'will remove players with no stats' do
      create :season_stat
      player_with_stats = Player.first
      player_with_no_stats = create :player, identifier: 'no_stat_player'
      Player.count.must_equal 2
      Stat.count.must_equal 1
      PlayerDestroyer.destroy_empty_players

      Stat.count.must_equal 1
      Player.count.must_equal 1
      Player.first.must_equal player_with_stats
    end
  end
end

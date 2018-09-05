require 'test_helper'

describe 'AllTimePresenter' do
  describe '#batting_list' do
    it 'will only include players with stats' do
      season_stat = create :season_stat
      player_with_stat = season_stat.player
      player_without_stat = create :player, identifier: 'no_stat_player'
      presenter = AllTimePresenter.new

      presenter.batting_list.must_equal [player_with_stat]
      Player.count.must_equal 2
      Stat.count.must_equal 1
    end

    it 'will only include player once' do
      season1 = create :season, year: 2017
      season2 = create :season, year: 2018
      stat1 = create :stat
      stat2 = create :stat
      player = create :player
      create :season_stat, player: player, season: season1, stat: stat1
      create :season_stat, player: player, season: season2, stat: stat2
      presenter = AllTimePresenter.new

      presenter.batting_list.must_equal [player]
      Player.count.must_equal 1
      Season.count.must_equal 2
      Stat.count.must_equal 2
    end

    it 'will sort players by highest career batting average' do
      season = create :season, year: 2017
      high_average = create :stat, hits: 1, at_bats: 1
      low_average = create :stat, hits: 0, at_bats: 0
      player_low_average = create :player, :sequence_identifier
      player_high_average = create :player, :sequence_identifier
      create :season_stat, player: player_low_average, season: season, stat: low_average
      create :season_stat, player: player_high_average, season: season, stat: high_average
      presenter = AllTimePresenter.new

      presenter.batting_list.must_equal [player_high_average, player_low_average]
      Player.count.must_equal 2
      Season.count.must_equal 1
      Stat.count.must_equal 2
    end

    it 'will only include 100 players' do
      season = create :season, year: 2017
      110.times do
        stat = create :stat, hits: 1, at_bats: 1
        player = create :player, :sequence_identifier
        create :season_stat, player: player, season: season, stat: stat
      end
      presenter = AllTimePresenter.new

      presenter.batting_list.size.must_equal 100
      Player.count.must_equal 110
    end
  end

  describe '#slugging_list' do
    it 'will only include players with stats' do
      season_stat = create :season_stat
      player_with_stat = season_stat.player
      player_without_stat = create :player, identifier: 'no_stat_player'
      presenter = AllTimePresenter.new

      presenter.slugging_list.must_equal [player_with_stat]
      Player.count.must_equal 2
      Stat.count.must_equal 1
    end

    it 'will only include player once' do
      season1 = create :season, year: 2017
      season2 = create :season, year: 2018
      stat1 = create :stat
      stat2 = create :stat
      player = create :player
      create :season_stat, player: player, season: season1, stat: stat1
      create :season_stat, player: player, season: season2, stat: stat2
      presenter = AllTimePresenter.new

      presenter.slugging_list.must_equal [player]
      Player.count.must_equal 1
      Season.count.must_equal 2
      Stat.count.must_equal 2
    end

    it 'will sort players by highest career slugging' do
      season = create :season, year: 2017
      high_slugging = create :stat, hits: 1, at_bats: 1
      low_slugging = create :stat, hits: 0, at_bats: 0
      player_low_slugging = create :player, :sequence_identifier
      player_high_slugging = create :player, :sequence_identifier
      create :season_stat, player: player_low_slugging, season: season, stat: low_slugging
      create :season_stat, player: player_high_slugging, season: season, stat: high_slugging
      presenter = AllTimePresenter.new

      presenter.slugging_list.must_equal [player_high_slugging, player_low_slugging]
      Player.count.must_equal 2
      Season.count.must_equal 1
      Stat.count.must_equal 2
    end

    it 'will only include 100 players' do
      season = create :season, year: 2017
      110.times do
        stat = create :stat, hits: 1, at_bats: 1
        player = create :player, :sequence_identifier
        create :season_stat, player: player, season: season, stat: stat
      end
      presenter = AllTimePresenter.new

      presenter.slugging_list.size.must_equal 100
      Player.count.must_equal 110
    end
  end
end

require 'test_helper'

describe 'Stat' do
  describe 'relations' do
    it 'has_one season through season stat' do
      create :season_stat
      stat = Stat.first
      season = Season.first

      Stat.count.must_equal 1
      Season.count.must_equal 1
      stat.season.must_equal season
    end

    it 'has_one player through season stat' do
      create :season_stat
      stat = Stat.first
      player = Player.first

      Stat.count.must_equal 1
      Player.count.must_equal 1
      stat.player.must_equal player
    end
  end

  describe 'defaults' do
    it 'will return 0 for games if there are none' do
      stat = create :stat, games: nil
      stat.games.must_equal 0
    end

    it 'will return 0 for at_bats if there are none' do
      stat = create :stat, at_bats: nil
      stat.at_bats.must_equal 0
    end

    it 'will return 0 for runs_scored if there are none' do
      stat = create :stat, runs_scored: nil
      stat.runs_scored.must_equal 0
    end

    it 'will return 0 for hits if there are none' do
      stat = create :stat, hits: nil
      stat.hits.must_equal 0
    end

    it 'will return 0 for doubles if there are none' do
      stat = create :stat, doubles: nil
      stat.doubles.must_equal 0
    end

    it 'will return 0 for triples if there are none' do
      stat = create :stat, triples: nil
      stat.triples.must_equal 0
    end

    it 'will return 0 for home_runs if there are none' do
      stat = create :stat, home_runs: nil
      stat.home_runs.must_equal 0
    end

    it 'will return 0 for runs_batted_in if there are none' do
      stat = create :stat, runs_batted_in: nil
      stat.runs_batted_in.must_equal 0
    end

    it 'will return 0 for stolen_bases if there are none' do
      stat = create :stat, stolen_bases: nil
      stat.stolen_bases.must_equal 0
    end

    it 'will return 0 for times_caught_steeling if there are none' do
      stat = create :stat, times_caught_steeling: nil
      stat.times_caught_steeling.must_equal 0
    end
  end

  describe 'validations' do
    it 'will validate the presence of player_identifier' do
      stat = build :stat, player_identifier: nil
      stat.valid?.must_equal false
      stat.errors.size.must_equal 1
      stat.errors.full_messages.must_equal ["Player identifier can't be blank"]
    end

    it 'will validate the presence of season_identifier' do
      stat = build :stat, season_identifier: nil
      stat.valid?.must_equal false
      stat.errors.size.must_equal 1
      stat.errors.full_messages.must_equal ["Season identifier can't be blank"]
    end

    it 'will validate the presence of player_identifier' do
      stat = build :stat, team_identifier: nil
      stat.valid?.must_equal false
      stat.errors.size.must_equal 1
      stat.errors.full_messages.must_equal ["Team identifier can't be blank"]
    end
  end
end

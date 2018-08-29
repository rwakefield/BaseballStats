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

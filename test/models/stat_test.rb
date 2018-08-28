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
end

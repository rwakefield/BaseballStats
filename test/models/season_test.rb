require 'test_helper'

describe 'Season' do
  describe 'relations' do
    it 'should have_many stats through season_stats' do
      create :season_stat
      season = Season.first
      stat = Stat.first

      Season.count.must_equal 1
      Stat.count.must_equal 1
      season.stats.must_equal [stat]
    end

    it 'should have_many players through season_stats' do
      create :season_stat
      season = Season.first
      player = Player.first

      Season.count.must_equal 1
      Player.count.must_equal 1
      season.players.must_equal [player]
    end
  end

  describe 'validations' do
    it 'will validate the presence of year' do
      season = build :season, year: nil
      season.valid?.must_equal false
      season.errors.size.must_equal 1
      season.errors.full_messages.must_equal ["Year can't be blank"]
    end
  end
end

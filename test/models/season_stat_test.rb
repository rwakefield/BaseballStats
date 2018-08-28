require 'test_helper'

describe 'SeasonStat' do
  describe 'relations' do
    it 'should belong_to season' do
      season_stat = create :season_stat
      season = Season.first

      SeasonStat.count.must_equal 1
      Season.count.must_equal 1
      season.season_stats.must_equal [season_stat]
      season_stat.season.must_equal season
    end

    it 'should belong_to stat' do
      season_stat = create :season_stat
      stat = Stat.first

      SeasonStat.count.must_equal 1
      Stat.count.must_equal 1
      stat.season_stat.must_equal season_stat
      season_stat.stat.must_equal stat
    end

    it 'should belong_to player' do
      season_stat = create :season_stat
      player = Player.first

      SeasonStat.count.must_equal 1
      Player.count.must_equal 1
      player.season_stats.must_equal [season_stat]
      season_stat.player.must_equal player
    end
  end

  describe 'validations' do
    it 'must reference a season' do
      assert_raises ActiveRecord::RecordInvalid do
        create :season_stat, season: nil
      end
    end

    it 'must reference a stat' do
      assert_raises ActiveRecord::RecordInvalid do
        create :season_stat, stat: nil
      end
    end

    it 'must reference a player' do
      assert_raises ActiveRecord::RecordInvalid do
        create :season_stat, player: nil
      end
    end
  end
end

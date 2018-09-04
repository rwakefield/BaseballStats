require 'test_helper'

describe 'StatPresenter' do
  describe '#stat_headers' do
    it 'will return an array of headers' do
      expected_results = [
        'Team',
        'Season',
        'Games',
        'At Bats',
        'Runs Scored',
        'Hits',
        'Doubles',
        'Triples',
        'Home Runs',
        'Runs Batted In',
        'Stolen Bases',
        'Caught Stealing',
        'Batting Average'
      ]
      StatPresenter.stat_headers.must_equal expected_results
    end
  end

  describe '#stat_rows' do
    describe 'when there are stats' do
      it 'will return the values from the stat in an array' do
        create :season_stat
        player = Player.first
        season = Season.first
        stat = Stat.first

        expected_average = '%.3f' % (stat.hits.to_f / stat.at_bats.to_f)

        expected_results = ['team_identifier', '2018', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', expected_average.to_s]
        presenter = StatPresenter.new(stats: player.stats)

        presenter.stat_rows.must_equal [expected_results]
        Stat.count.must_equal 1
        Player.count.must_equal 1
        Season.count.must_equal 1
      end
    end

    describe 'when there are no stats' do
      it 'will be empty' do
        presenter = StatPresenter.new(stats: [])
        presenter.stat_rows.must_be_empty
      end
    end
  end
end

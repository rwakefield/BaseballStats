require 'test_helper'

describe 'StatPresenter' do
  describe '#stat_headers' do
    it 'will return an array of headers' do
      expected_results = [
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
        'Caught Stealing'
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
        expected_results = %w(2018 1 2 3 4 5 6 7 8 9 10)
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

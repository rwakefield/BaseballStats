require 'test_helper'

describe 'AllTimePresenter' do
  describe '#batting_list' do

    it 'will sort players by highest career batting average' do
      player_high_average = create :player, :sequence_identifier
      player_low_average = create :player, :sequence_identifier
      create :career_stat, player: player_high_average, batting_average: 4.0
      create :career_stat, player: player_low_average, batting_average: 0.0
      presenter = AllTimePresenter.new

      presenter.batting_list.must_equal [player_high_average, player_low_average]
      Player.count.must_equal 2
      CareerStat.count.must_equal 2
    end

    it 'will only include 100 players' do
      110.times do
        player = create :player, :sequence_identifier
        create :career_stat, player: player
      end
      presenter = AllTimePresenter.new

      presenter.batting_list.size.must_equal 100
      Player.count.must_equal 110
      CareerStat.count.must_equal 110
    end
  end

  describe '#slugging_list' do
    it 'will sort players by highest career slugging' do
      player_high_slugging = create :player, :sequence_identifier
      player_low_slugging = create :player, :sequence_identifier
      create :career_stat, player: player_high_slugging, slugging_percentage: 4.0
      create :career_stat, player: player_low_slugging, slugging_percentage: 0.0
      presenter = AllTimePresenter.new

      presenter.slugging_list.must_equal [player_high_slugging, player_low_slugging]
      Player.count.must_equal 2
      CareerStat.count.must_equal 2
    end

    it 'will only include 100 players' do
      110.times do
        player = create :player, :sequence_identifier
        create :career_stat, player: player
      end
      presenter = AllTimePresenter.new

      presenter.slugging_list.size.must_equal 100
      Player.count.must_equal 110
      CareerStat.count.must_equal 110
    end
  end
end

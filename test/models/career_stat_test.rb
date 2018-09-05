require 'test_helper'

describe 'CareerStat' do
  describe 'relations' do
    it 'will belong to player' do
      career_stat = create :career_stat
      player = Player.first
      player.career_stat.must_equal career_stat
      career_stat.player.must_equal player
      Player.count.must_equal 1
      CareerStat.count.must_equal 1
    end
  end

  describe 'validations' do
    it 'will raise error if there are more than one record per player' do
      career_stat = create :career_stat
      player = Player.first
      other_stat = build :career_stat, player: player
      other_stat.valid?.must_equal false
      other_stat.errors.full_messages.must_equal ['Player has already been taken']
      Player.count.must_equal 1
    end
  end
end

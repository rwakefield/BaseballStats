require 'test_helper'

describe 'Player' do
  describe 'realations' do
    it 'should have_and_belong_to_many teams' do
      player = create :player, :with_team
      team = Team.first

      Player.count.must_equal 1
      Team.count.must_equal 1
      player.teams.must_equal [team]
      team.players.must_equal [player]
    end

    it 'should have_many seasons through season_stats' do
      create :season_stat
      season = Season.first
      player = Player.first

      Player.count.must_equal 1
      Season.count.must_equal 1
      player.seasons.must_equal [season]
    end

    it 'should have_many leagues through teams' do
      player = create :player, :with_team
      team = Team.first
      league = create :league, teams: [team]

      Player.count.must_equal 1
      Team.count.must_equal 1
      League.count.must_equal 1
      player.leagues.must_equal [league]
    end

    it 'should have_many stats through season_stats' do
      create :season_stat
      player = Player.first
      stat = Stat.first

      Player.count.must_equal 1
      Stat.count.must_equal 1
      player.stats.must_equal [stat]
    end

    it 'should have one career stat' do
      career_stat = create :career_stat
      player = Player.first

      player.career_stat.must_equal career_stat
      career_stat.player.must_equal player
      Player.count.must_equal 1
      CareerStat.count.must_equal 1
    end
  end

  describe '#career_batting_average' do
    it 'will pull the data from the batting average column in career stat when there is one' do
      career_stat = create :career_stat
      player = Player.first
      expected_result = '%.3f' % career_stat.batting_average
      player.career_batting_average.must_equal expected_result
      Player.count.must_equal 1
      CareerStat.count.must_equal 1
    end

    it 'will be 0.00 when there is no career_stat' do
      player = create :player
      player.career_batting_average.must_equal '0.000'
    end
  end

  describe '#career_slugging_percentage' do
    it 'will pull the data from the batting average column in career stat when there is one' do
      career_stat = create :career_stat
      player = Player.first
      expected_result = '%.3f' % career_stat.slugging_percentage
      player.career_slugging_percentage.must_equal expected_result
      Player.count.must_equal 1
      CareerStat.count.must_equal 1
    end

    it 'will be 0.00 when there is no career_stat' do
      player = create :player
      player.career_slugging_percentage.must_equal '0.000'
    end
  end

  describe 'validations' do
    it 'will validate the presence of first_name' do
      player = build :player, first_name: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["First name can't be blank"]
    end

    it 'will validate the presence of last_name' do
      player = build :player, last_name: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["Last name can't be blank"]
    end

    it 'will validate the presence of birth_year' do
      player = build :player, birth_year: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["Birth year can't be blank"]
    end

    it 'will validate the presence of identifier' do
      player = build :player, identifier: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["Identifier can't be blank"]
    end

    it 'will validate the uniqueness of identifier' do
      create :player
      player = build :player
      player.valid?.must_equal false
      player.errors.count.must_equal 1
      player.errors.full_messages.must_equal ['Identifier has already been taken']
    end

    it 'will validate the inclusion of imported' do
      player = build :player, imported: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ['Imported is not included in the list']
    end
  end

  describe '#full_name' do
    it 'will return the full name of the player' do
      player = create :player, first_name: 'bOb', last_name: 'RoSS'
      player.full_name.must_equal 'Bob Ross'
    end
  end
end

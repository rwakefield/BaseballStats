require 'test_helper'
require 'csv'

describe 'BattingLoader' do
  let(:headers) { ['playerID', 'yearID', 'league', 'teamID', 'G', 'AB', 'R', 'H', '2B', '3B', 'HR', 'RBI', 'SB', 'CS'] }
  let(:fields) { ['abreubo01', '2012', 'NL', 'LAN', '92', '195', '28', '48', '8', '1', '3', '19', '6', '2'] }

  describe '#load' do
    describe 'when the player does not exist' do
      it 'will load nothing' do
        csv_row = CSV::Row.new(headers, fields, true)
        loader = BattingLoader.new(csv_row: csv_row)
        loader.load

        League.count.must_equal 0
        Organization.count.must_equal 0
        Player.count.must_equal 0
        Season.count.must_equal 0
        SeasonStat.count.must_equal 0
        Stat.count.must_equal 0
        Team.count.must_equal 0
      end
    end

    describe 'when the player exists' do
      it 'will load all the things' do
        create :player, identifier: fields[0]
        csv_row = CSV::Row.new(headers, fields, true)
        loader = BattingLoader.new(csv_row: csv_row)
        loader.load

        assert_batting
      end

      it 'will not duplicate data on multiple runs' do
        create :player, identifier: fields[0]
        csv_row = CSV::Row.new(headers, fields, true)
        loader = BattingLoader.new(csv_row: csv_row)
        loader.load
        loader.load

        assert_batting
      end
    end
  end

  def assert_batting
    player = Player.first
    league = League.first
    season = Season.first
    stat = Stat.first
    team = Team.first

    League.count.must_equal 1
    Organization.count.must_equal 1
    Player.count.must_equal 1
    Season.count.must_equal 1
    SeasonStat.count.must_equal 1
    Stat.count.must_equal 1
    Team.count.must_equal 1

    league.teams.must_equal [team]

    player.teams.must_equal [team]
    player.leagues.must_equal [league]
    player.seasons.must_equal [season]
    player.stats.must_equal [stat]

    season.stats.must_equal [stat]
    season.players.must_equal [player]

    stat.season.must_equal season
    stat.player.must_equal player

    team.players.must_equal [player]
    team.leagues.must_equal [league]

    season.year.must_equal fields[1].to_i
    league.name.must_equal fields[2]
    team.name.must_equal fields[3]
    stat.games.must_equal fields[4].to_i
    stat.at_bats.must_equal fields[5].to_i
    stat.runs_scored.must_equal fields[6].to_i
    stat.hits.must_equal fields[7].to_i
    stat.doubles.must_equal fields[8].to_i
    stat.triples.must_equal fields[9].to_i
    stat.home_runs.must_equal fields[10].to_i
    stat.runs_batted_in.must_equal fields[11].to_i
    stat.stolen_bases.must_equal fields[12].to_i
    stat.times_caught_steeling.must_equal fields[13].to_i
  end
end

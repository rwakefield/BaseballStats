require 'test_helper'

describe 'PlayerPresenter' do
  describe '#player' do
    it 'will return player' do
      player = create :player
      presenter = PlayerPresenter.new(player: player)
      presenter.player.must_equal player
      Player.count.must_equal 1
    end
  end

  describe '#years_active' do
    describe 'when the player has seasons' do
      it 'will return season years' do
        create :season_stat
        player = Player.first
        season1 = Season.first
        season2 = create :season, year: '2004'
        create :season_stat, player: player, season: season2

        presenter = PlayerPresenter.new(player: player)

        presenter.years_active.must_equal "#{season2.year}, #{season1.year}"
        Player.count.must_equal 1
        Season.count.must_equal 2
      end
    end

    describe 'when the player does not have seasons' do
      it 'will be unknown' do
        player = create :player
        presenter = PlayerPresenter.new(player: player)

        presenter.years_active.must_equal 'unknown'
        Player.count.must_equal 1
        Season.count.must_equal 0
      end
    end
  end

  describe '#teams' do
    describe 'when the player has teams' do
      it 'will return the names of the teams the player has' do
        team1 = create :team
        team2 = create :team, name: 'NY'
        player = create :player, teams: [team1, team2]
        presenter = PlayerPresenter.new(player: player)

        presenter.teams.must_equal "#{team1.name}, #{team2.name}"
        Player.count.must_equal 1
        Team.count.must_equal 2
      end
    end

    describe 'when the player does not have any teams' do
      it 'will be unknown' do
        player = create :player
        presenter = PlayerPresenter.new(player: player)

        presenter.teams.must_equal 'unknown'
        Player.count.must_equal 1
        Team.count.must_equal 0
      end
    end
  end

  describe '#leagues' do
    describe 'when the player has leagues' do
      it 'will return the names of the leagues the player has' do
        create :organization
        team = Team.first
        player = create :player, teams: [team]
        league = League.first

        presenter = PlayerPresenter.new(player: player)

        presenter.leagues.must_equal league.name
        Player.count.must_equal 1
        League.count.must_equal 1
        Organization.count.must_equal 1
      end
    end

    describe 'when the player does not have any leagues' do
      it 'will be unknown' do
        player = create :player
        presenter = PlayerPresenter.new(player: player)

        presenter.leagues.must_equal 'unknown'
        Player.count.must_equal 1
        League.count.must_equal 0
      end
    end

  end

  describe '#season_stats' do
    it 'will output stats ordered by season year' do
      season1 = create :season, year: 2018
      season2 = create :season, year: 2004
      player = create :player
      create :season_stat, player: player, season: season1
      create :season_stat, player: player, season: season2
      player = Player.first

      presenter = PlayerPresenter.new(player: player)
      presenter.season_stats.must_equal [season2.stats.first, season1.stats.first]
      Player.count.must_equal 1
      Season.count.must_equal 2
      Stat.count.must_equal 2
    end
  end
end

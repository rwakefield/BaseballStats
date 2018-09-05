class LeaguePresenter < AllTimePresenter
  def initialize(league:)
    @league = league
  end

  private

  def player_source
    league.players
  end

  attr_reader :league
end

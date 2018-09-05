class LeaguePresenter < AllTimePresenter
  def initialize(league:)
    @league = league
  end

  private

  def players
    league.players.left_outer_joins(:stats).where.not(stats: { id: nil }).distinct
  end

  attr_reader :league
end

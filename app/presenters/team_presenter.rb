class TeamPresenter < AllTimePresenter
  def initialize(team:)
    @team = team
  end

  private

  def players
    team.players.left_outer_joins(:stats).where.not(stats: { id: nil }).distinct
  end

  attr_reader :team
end

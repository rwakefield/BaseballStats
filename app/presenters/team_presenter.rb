class TeamPresenter < AllTimePresenter
  def initialize(team:)
    @team = team
  end

  private

  def player_source
    team.players
  end

  attr_reader :team
end

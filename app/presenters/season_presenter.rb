class SeasonPresenter < AllTimePresenter
  def initialize(season:)
    @season = season
  end

  private

  def players
    season.players.distinct
  end

  attr_reader :season
end

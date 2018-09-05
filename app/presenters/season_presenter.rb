class SeasonPresenter < AllTimePresenter
  def initialize(season:)
    @season = season
  end

  private

  def player_source
    season.players
  end

  attr_reader :season
end

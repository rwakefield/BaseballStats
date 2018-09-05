class AllTimePresenter
  def initialize
  end

  def batting_list
    player_source.joins(:career_stat).select('players.*, career_stats.batting_average as batting_average').distinct.order('batting_average desc').limit(100)
  end

  def slugging_list
    player_source.joins(:career_stat).select('players.*, career_stats.slugging_percentage as slugging_percentage').distinct.order('slugging_percentage desc').limit(100)
  end

  private

  def player_source
    Player
  end
end

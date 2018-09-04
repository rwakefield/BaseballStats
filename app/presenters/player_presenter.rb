class PlayerPresenter
  include CareerAverageCalculator
  include CareerSluggingCalculator

  attr_reader :player

  def initialize(player:)
    @player = player
  end

  def years_active
    if player.seasons.empty?
      'unknown'
    else
      player.seasons.map(&:year).uniq.sort.join(', ')
    end
  end

  def teams
    if player.teams.empty?
      'unknown'
    else
      player.teams.map(&:name).uniq.sort.join(', ')
    end
  end

  def leagues
    if player.leagues.empty?
      'unknown'
    else
      player.leagues.map(&:name).uniq.sort.join(', ')
    end
  end

  def stats
    player.stats.joins(:season).order('seasons.year')
  end
end

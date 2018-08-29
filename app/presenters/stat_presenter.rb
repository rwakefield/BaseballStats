class StatPresenter
  def initialize(stats:)
    @stats = stats
  end

  def self.stat_headers
    [
      'Season',
      'Games',
      'At Bats',
      'Runs Scored',
      'Hits',
      'Doubles',
      'Triples',
      'Home Runs',
      'Runs Batted In',
      'Stolen Bases',
      'Caught Stealing'
    ]
  end

  def stat_rows
    stats.each.map do |stat|
      [
        stat.season.year,
        stat.games,
        stat.at_bats,
        stat.runs_scored,
        stat.hits,
        stat.doubles,
        stat.triples,
        stat.home_runs,
        stat.runs_batted_in,
        stat.stolen_bases,
        stat.times_caught_steeling
      ].map(&:to_s)
    end
  end

  private

  attr_reader :stats
end

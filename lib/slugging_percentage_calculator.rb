# Slugging % = total_bases / at_bats

module SluggingPercentageCalculator
  def slugging_percentage(baseball_stat:)
    total_at_bats = baseball_stat.at_bats
    return '0.000' if total_at_bats.nil? || total_at_bats == 0
    total_bases = (baseball_stat.doubles * 2) + (baseball_stat.triples * 3) + (baseball_stat.home_runs * 4) + baseball_stat.singles
    '%.3f' % (total_bases.to_f / total_at_bats.to_f)
  end
end

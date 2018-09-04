# Batting Average = hits / at_bats

module BattingAverageCalculator
  def batting_average(baseball_stat:)
    at_bats = baseball_stat.at_bats
    return '0.000' if at_bats == 0 || at_bats.nil?
    number = baseball_stat.hits.to_f / baseball_stat.at_bats.to_f
    '%.3f' % number
  end
end

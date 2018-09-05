# Career Batting Average = career hits / career at_bats

module CareerAverageCalculator
  def calculate_career_batting_average
    return 0.000 unless self.class.method_defined? :stats
    return 0.000 if stats.empty?
    total_at_bats = stats.map(&:at_bats).inject(0, &:+).to_f
    total_hits = stats.map(&:hits).inject(0, &:+).to_f
    return 0.000 if total_at_bats == 0
    (total_hits / total_at_bats).round(3)
  end
end

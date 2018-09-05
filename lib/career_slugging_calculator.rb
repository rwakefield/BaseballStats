# Career Slugging Percentage = career bases / career at_bats

module CareerSluggingCalculator
  def calculate_career_slugging_percentage
    return 0.000 unless self.class.method_defined? :stats
    return 0.000 if stats.empty?

    total_at_bats = stats.map(&:at_bats).inject(0, &:+)
    total_singles = stats.map(&:singles).inject(0, &:+)
    total_doubles = stats.map(&:doubles).inject(0, &:+)
    total_triples = stats.map(&:triples).inject(0, &:+)
    total_home_runs = stats.map(&:home_runs).inject(0, &:+)

    total_bases = (total_doubles * 2) + (total_triples * 3) + (total_home_runs * 4) + total_singles

    return 0.000 if total_at_bats == 0

    (total_bases.to_f / total_at_bats.to_f).round(3)
  end
end

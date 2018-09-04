require 'test_helper'

class TestingClassWithStats
  include CareerSluggingCalculator

  def stats
    Stat.all
  end
end

class TestingClassWithoutStats
  include CareerSluggingCalculator
end

describe 'CareerSluggingCalculator' do
  describe '#career_slugging_percentage' do
    it 'will return the career at bats / career hits with three decimal places' do
      tester = TestingClassWithStats.new
      create :stat, hits: 1, doubles: 0, triples: 0, home_runs: 1, at_bats: 5
      create :stat, hits: 3, doubles: 1, triples: 1, home_runs: 0, at_bats: 10

      expected_result = '%.3f' % ((1 + 2 + 3 + 4).to_f / 15.0)
      tester.career_slugging_percentage.must_equal expected_result
    end

    it 'will return 0.000 if there career at bats is 0' do
      tester = TestingClassWithStats.new
      create :stat, at_bats: 0
      create :stat, at_bats: nil
      tester.career_slugging_percentage.must_equal '0.000'
    end

    it 'will return 0.000 if stats are empty' do
      tester = TestingClassWithStats.new
      tester.career_slugging_percentage.must_equal '0.000'
    end

    it 'will return 0.000 when the class does not respond to stats' do
      tester = TestingClassWithoutStats.new
      tester.career_slugging_percentage.must_equal '0.000'
    end
  end
end

require 'test_helper'

class TestingClassWithStats
  include CareerAverageCalculator

  def stats
    Stat.all
  end
end

class TestingClassWithoutStats
  include CareerAverageCalculator
end

describe 'CareerAverageCalculator' do
  describe '#calculate_career_batting_average' do
    it 'will return the career at bats / career hits with three decimal places' do
      tester = TestingClassWithStats.new
      create :stat, at_bats: 50, hits: 20
      create :stat, at_bats: 50, hits: 60
      tester.calculate_career_batting_average.must_equal 0.800
    end

    it 'will return 0.000 if there career at bats is 0' do
      tester = TestingClassWithStats.new
      create :stat, at_bats: 0, hits: 0
      create :stat, at_bats: nil, hits: nil
      tester.calculate_career_batting_average.must_equal 0.000
    end

    it 'will return 0.000 if stats are empty' do
      tester = TestingClassWithStats.new
      tester.calculate_career_batting_average.must_equal 0.000
    end

    it 'will return 0.000 when the class does not respond to stats' do
      tester = TestingClassWithoutStats.new
      tester.calculate_career_batting_average.must_equal 0.000
    end
  end
end

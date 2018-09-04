require 'test_helper'

class TestingClass
  include BattingAverageCalculator
end

describe 'BattingAverageCalculator' do
  describe '#batting_average' do
    it 'will return the at bats / by the hits with 3 decimal places when there are at bats' do
      tester = TestingClass.new
      stat = create :stat, at_bats: 100, hits: 80
      tester.batting_average(baseball_stat: stat).must_equal '0.800'
    end

    it 'will return 0.000 when there are no at bats' do
      tester = TestingClass.new
      stat = create :stat, at_bats: 0, hits: 80
      tester.batting_average(baseball_stat: stat).must_equal '0.000'
    end

    it 'will return 0.000 when at bats is not set' do
      tester = TestingClass.new
      stat = create :stat, at_bats: nil, hits: 80
      tester.batting_average(baseball_stat: stat).must_equal '0.000'
    end
  end
end

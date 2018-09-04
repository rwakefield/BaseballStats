require 'test_helper'

class TestingClass
  include SluggingPercentageCalculator
end

describe 'SluggingPercentageCalculator' do
  describe '#slugging_percentage' do
    it 'will return the total bases divided by the at bats with percision of 3' do
      tester = TestingClass.new
      stat = create :stat, hits: 4, doubles: 1, triples: 1, home_runs: 1, at_bats: 10
      expected_result = '%.3f' % ((1.0 + 2.0 + 3.0 + 4.0) / 10.0)

      tester.slugging_percentage(baseball_stat: stat).must_equal expected_result
    end

    it 'will return 0.000 when there are no at_bats' do
      tester = TestingClass.new
      stat = create :stat, at_bats: 0
      tester.slugging_percentage(baseball_stat: stat).must_equal '0.000'
    end

    it 'will return 0.000 when there are no at_bats' do
      tester = TestingClass.new
      stat = create :stat, at_bats: nil
      tester.slugging_percentage(baseball_stat: stat).must_equal '0.000'
    end
  end
end

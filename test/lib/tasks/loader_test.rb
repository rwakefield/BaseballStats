require 'rake'
require 'test_helper'

describe 'Loader' do
  before do
    Rake::Task.clear
    RocketHomework::Application.load_tasks
  end

  describe '#load_players' do
    subject { Rake::Task['loader:load_players'] }

    it 'should load the players from the csv' do
      subject.invoke
      assert_players
    end

    it 'should be idempotent' do
      subject.invoke
      subject.invoke
      assert_players
    end
  end

  describe '#load_batting' do
    subject { Rake::Task['loader:load_batting'] }

    before do
      create :player, identifier: 'abreubo01'
      create :player, identifier: 'allenbr01'
    end

    it 'should load league, organization, season, stat, and team from the csv' do
      subject.invoke
      assert_batting
    end

    it 'should be idempotent' do
      subject.invoke
      subject.invoke
      assert_batting
    end
  end

  def assert_players
    expected_identifiers = ['aaronha01', 'aaronto01', 'adairbi01', 'adamsbo01', 'adamsbo02', 'adamsbo03', 'bicknch01', 'biddlro01']
    Player.all.map(&:identifier).sort.must_equal expected_identifiers
  end

  def assert_batting
    Player.count.must_equal 2
    Season.count.must_equal 3
    League.count.must_equal 2
    Team.count.must_equal 4
    Stat.count.must_equal 5
    CareerStat.count.must_equal 2
  end
end

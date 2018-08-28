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

  def assert_players
    expected_identifiers = ['aaronha01', 'aaronto01', 'adairbi01', 'adamsbo01', 'adamsbo02', 'adamsbo03', 'bicknch01', 'biddlro01']
    Player.all.map(&:identifier).sort.must_equal expected_identifiers
  end
end

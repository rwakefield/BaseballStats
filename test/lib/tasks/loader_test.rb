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
    Player.count.must_equal 18113
  end
end

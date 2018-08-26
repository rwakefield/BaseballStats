require 'rake'
require 'test_helper'

describe 'Destroyer' do
  before do
    Rake::Task.clear
    RocketHomework::Application.load_tasks
  end

  describe '#destroy_players' do
    subject { Rake::Task['destroyer:destroy_players'] }

    it 'should load the players from the csv' do
      non_imported_player = create :player, :sequence_identifier
      create :player, :sequence_identifier, :imported
      create :player, :sequence_identifier, :imported

      Player.count.must_equal 3
      subject.invoke
      Player.count.must_equal 1
      player = Player.first
      player.must_equal non_imported_player
      player.imported.must_equal false
    end
  end
end

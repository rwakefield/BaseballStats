require 'test_helper'

describe 'PlayerDestroyer' do
  describe '#destroy_all_players' do
    it 'will destroy all players where imported is true' do
      non_imported_player = create :player, :sequence_identifier
      create :player, :sequence_identifier, :imported
      create :player, :sequence_identifier, :imported
      Player.count.must_equal 3
      PlayerDestroyer.destroy_all_players
      Player.count.must_equal 1
      player = Player.first
      player.must_equal non_imported_player
      player.imported.must_equal false
    end
  end
end

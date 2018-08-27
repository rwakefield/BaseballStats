require 'test_helper'

describe 'Player' do
  describe 'validations' do
    it 'will validate the presence of first_name' do
      player = build :player, first_name: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["First name can't be blank"]
    end

    it 'will validate the presence of last_name' do
      player = build :player, last_name: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["Last name can't be blank"]
    end

    it 'will validate the presence of birth_year' do
      player = build :player, birth_year: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["Birth year can't be blank"]
    end

    it 'will validate the presence of identifier' do
      player = build :player, identifier: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ["Identifier can't be blank"]
    end

    it 'will validate the uniqueness of identifier' do
      create :player
      player = build :player
      player.valid?.must_equal false
      player.errors.count.must_equal 1
      player.errors.full_messages.must_equal ['Identifier has already been taken']
    end

    it 'will validate the inclusion of imported' do
      player = build :player, imported: nil
      player.valid?.must_equal false
      player.errors.size.must_equal 1
      player.errors.full_messages.must_equal ['Imported is not included in the list']
    end
  end

  describe '#full_name' do
    it 'will return the full name of the player' do
      player = create :player, first_name: 'bOb', last_name: 'RoSS'
      player.full_name.must_equal 'Bob Ross'
    end
  end
end

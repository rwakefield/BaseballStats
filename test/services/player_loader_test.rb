require 'test_helper'

describe 'PlayerLoader' do
  describe '#load' do
    it 'will generate identifier if none is passed' do
      PlayerLoader.new(first_name: 'Bob', last_name: 'Ross', birth_year: 1942, identifier: nil).load
      Player.count.must_equal 1
      Player.first.identifier.must_equal 'rossbo01'
    end

    it 'will stub other data if none is passed' do
      PlayerLoader.new(first_name: nil, last_name: nil, birth_year: nil, identifier: 'identifier').load
      Player.count.must_equal 1
      player = Player.find_by(identifier: 'identifier')
      player.first_name.must_equal 'unknown'
      player.last_name.must_equal 'unknown'
      player.birth_year.must_equal 0
    end

    describe 'when the player exists' do
      it 'will update the existing player' do
        player = create :player
        Player.count.must_equal 1
        PlayerLoader.new(first_name: 'Bob', last_name: 'Ross', birth_year: player.birth_year, identifier: player.identifier).load
        Player.count.must_equal 1
        results = Player.first
        results.first_name.must_equal 'Bob'
        results.last_name.must_equal 'Ross'
      end
    end

    describe 'when the player does not exist' do
      it 'will create a new player' do
        Player.count.must_equal 0
        PlayerLoader.new(first_name: 'Bob', last_name: 'Ross', birth_year: 1942, identifier: 'Bob').load
        Player.count.must_equal 1
      end
    end

    it 'is idempotent' do
      Player.count.must_equal 0
      loader = PlayerLoader.new(first_name: 'Bob', last_name: 'Ross', birth_year: 1942, identifier: 'Bob')
      loader.load
      loader.load
      Player.count.must_equal 1
    end
  end
end

require 'test_helper'

describe 'PlayerSearch' do
  describe '#search' do
    it 'will find by first name if there is one word' do
      player = create :player
      results = PlayerSearch.new(query: player.first_name).search
      results.must_equal [player]
    end

    it 'is case insensitive' do
      player = create :player
      results = PlayerSearch.new(query: player.first_name.downcase).search
      results.must_equal [player]
    end

    it 'will find by last name if there is one word' do
      player = create :player
      results = PlayerSearch.new(query: player.last_name).search
      results.must_equal [player]
    end

    it 'will find by birth year if it is a number' do
      player = create :player
      results = PlayerSearch.new(query: player.birth_year).search
      results.must_equal [player]
    end

    it 'will search by full name' do
      player = create :player, :sequence_identifier
      create :player, :sequence_identifier, last_name: 'Thisisnotthelastnamethatyouarelookingfor'
      Player.count.must_equal 2
      results = PlayerSearch.new(query: player.full_name).search
      results.must_equal [player]
    end

    it 'will fall back on single matches if full name is not hit' do
      player1 = create :player, :sequence_identifier
      player2 = create :player, :sequence_identifier, last_name: 'Smith'
      Player.count.must_equal 2
      results = PlayerSearch.new(query: "#{player1.first_name} BogusLastName").search
      results.count.must_equal 2
      results.must_include player1
      results.must_include player2
    end
  end
end

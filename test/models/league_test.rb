require 'test_helper'

describe 'League' do
  describe 'relations' do
    it 'should have_many team through organizations' do
      create :organization
      league = League.first
      team = Team.first

      Organization.count.must_equal 1
      League.count.must_equal 1
      Team.count.must_equal 1
      league.teams.must_equal [team]
    end

    it 'should have_many leagues through teams' do
      create :organization
      league = League.first
      team = Team.first
      player = create :player

      player.teams << team

      league.players.must_equal [player]
      Player.count.must_equal 1
      Organization.count.must_equal 1
      League.count.must_equal 1
      Team.count.must_equal 1
    end
  end

  describe 'validations' do
    it 'will validate the presence of name' do
      league = build :league, name: nil
      league.valid?.must_equal false
      league.errors.size.must_equal 1
      league.errors.full_messages.must_equal ["Name can't be blank"]
    end
  end
end

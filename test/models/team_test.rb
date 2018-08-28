require 'test_helper'

describe 'Team' do
  describe 'relations' do
    it 'should have_and_belong_to_many players' do
      player = create :player, :with_team
      Player.count.must_equal 1
      Team.count.must_equal 1
      team = Team.first
      player.teams.must_equal [team]
      team.players.must_equal [player]
    end

    it 'should have_many leagues through organizations' do
      create :organization
      team = Team.first
      league = League.first

      Team.count.must_equal 1
      Organization.count.must_equal 1
      League.count.must_equal 1
      team.leagues.must_equal [league]
    end
  end

  describe 'validations' do
    it 'will validate the presence of name' do
      team = build :team, name: nil
      team.valid?.must_equal false
      team.errors.size.must_equal 1
      team.errors.full_messages.must_equal ["Name can't be blank"]
    end
  end
end

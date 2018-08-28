require 'test_helper'

describe 'Organization' do
  describe 'relations' do
    it 'should belong_to team' do
      organization = create :organization
      team = Team.first

      Organization.count.must_equal 1
      Team.count.must_equal 1
      team.organizations.must_equal [organization]
      organization.team.must_equal team
    end

    it 'should belong_to league' do
      organization = create :organization
      league = League.first

      Organization.count.must_equal 1
      League.count.must_equal 1
      league.organizations.must_equal [organization]
      organization.league.must_equal league
    end
  end

  describe 'validations' do
    it 'must reference a team' do
      assert_raises ActiveRecord::RecordInvalid do
        create :organization, team: nil
      end
    end

    it 'must reference a league' do
      assert_raises ActiveRecord::RecordInvalid do
        create :organization, league: nil
      end
    end
  end
end

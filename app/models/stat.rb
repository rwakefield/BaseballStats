class Stat < ApplicationRecord
  has_one :season_stat
  has_one :season, through: :season_stat
  has_one :player, through: :season_stat
  validates_presence_of :player_identifier, :season_identifier, :team_identifier

  before_save :set_defaults

  def singles
    hits - (doubles + triples + home_runs)
  end

  private

  def set_defaults
    self.games ||= 0
    self.at_bats ||= 0
    self.runs_scored ||= 0
    self.hits ||= 0
    self.doubles ||= 0
    self.triples ||= 0
    self.home_runs ||= 0
    self.runs_batted_in ||= 0
    self.stolen_bases ||= 0
    self.times_caught_steeling ||= 0
  end
end

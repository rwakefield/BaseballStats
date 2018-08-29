class Stat < ApplicationRecord
  has_one :season_stat
  has_one :season, through: :season_stat
  has_one :player, through: :season_stat

  validates_presence_of :player_identifier, :season_identifier, :team_identifier
end

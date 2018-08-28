class Stat < ApplicationRecord
  has_one :season_stat
  has_one :season, through: :season_stat
  has_one :player, through: :season_stat
end

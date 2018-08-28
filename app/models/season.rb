class Season < ApplicationRecord
  has_many :season_stats
  has_many :stats, through: :season_stats
  has_many :players, through: :season_stats

  validates_presence_of :year
end

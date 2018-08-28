class SeasonStat < ApplicationRecord
  belongs_to :season
  belongs_to :stat
  belongs_to :player
end

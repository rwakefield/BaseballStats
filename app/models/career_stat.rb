class CareerStat < ApplicationRecord
  belongs_to :player
  validates_uniqueness_of :player_id
end

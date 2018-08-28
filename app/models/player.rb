class Player < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :leagues, through: :teams
  has_many :season_stats
  has_many :seasons, through: :season_stats
  has_many :stats, through: :season_stats

  validates_presence_of :first_name, :last_name, :birth_year, :identifier
  validates_inclusion_of :imported, in: [true, false]
  validates_uniqueness_of :identifier

  def full_name
    "#{first_name} #{last_name}".split.map(&:capitalize).join(' ')
  end
end

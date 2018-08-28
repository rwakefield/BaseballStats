class Team < ApplicationRecord
  has_and_belongs_to_many :players
  has_many :organizations
  has_many :leagues, through: :organizations

  validates_presence_of :name
end

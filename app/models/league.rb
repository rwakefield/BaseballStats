class League < ApplicationRecord
  has_many :organizations
  has_many :teams, through: :organizations
  has_many :players, through: :teams

  validates_presence_of :name
end

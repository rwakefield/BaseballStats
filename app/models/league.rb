class League < ApplicationRecord
  has_many :organizations
  has_many :teams, through: :organizations

  validates_presence_of :name
end

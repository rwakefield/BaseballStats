class Player < ApplicationRecord
  validates_presence_of :first_name, :last_name, :birth_year, :identifier
  validates_uniqueness_of :identifier
end

class Player < ApplicationRecord
  validates_presence_of :first_name, :last_name, :birth_year, :identifier
  validates_inclusion_of :imported, in: [true, false]
  validates_uniqueness_of :identifier

  def full_name
    "#{first_name} #{last_name}".split.map(&:capitalize).join(' ')
  end
end

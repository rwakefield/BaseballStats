class PlayerLoader
  def initialize(first_name:, last_name:, birth_year:, identifier:)
    @first_name = first_name || 'unknown'
    @last_name = last_name || 'unknown'
    @birth_year = birth_year || 0
    @identifier = identifier || generated_identifier
  end

  def load
    Player.find_or_initialize_by(identifier: identifier).tap do |p|
      p.first_name = first_name
      p.last_name = last_name
      p.birth_year = birth_year
    end.save!
  end

  private

  def generated_identifier
    num = 0
    part1 = last_name.delete("^a-zA-Z")[0...5]
    part2 = first_name.delete("^a-zA-Z")[0...2]
    generated = nil
    loop do
      num += 1
      generated = "#{part1}#{part2}#{num.to_s.rjust(2, '0')}".downcase
      break unless Player.find_by(identifier: generated)
    end
    generated
  end

  attr_reader :first_name, :last_name, :birth_year, :identifier
end

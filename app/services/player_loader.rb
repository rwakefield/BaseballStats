class PlayerLoader
  def initialize(first_name:, last_name:, birth_year:, identifier:)
    @first_name = first_name || 'unknown'
    @last_name = last_name || 'unknown'
    @birth_year = birth_year || 0
    @identifier = identifier
  end

  def load
    set_valid_identifier unless identifier
    Player.find_or_initialize_by(identifier: identifier).tap do |p|
      p.first_name = first_name
      p.last_name = last_name
      p.birth_year = birth_year
      p.imported = true
    end.save!
  end

  private

  def set_valid_identifier
    num = 1
    loop do
      @identifier = generate_identifier(num)
      break if identifier_is_valid?
      num += 1
    end
  end

  def generate_identifier(num)
    part1 = last_name.delete("^a-zA-Z")[0...5]
    part2 = first_name.delete("^a-zA-Z")[0...2]
    "#{part1}#{part2}#{num.to_s.rjust(2, '0')}".downcase
  end

  def identifier_is_valid?
    player = Player.find_by(identifier: identifier)
    return true unless player
    player.birth_year == birth_year ? true : false
  end

  attr_reader :first_name, :last_name, :birth_year, :identifier
end

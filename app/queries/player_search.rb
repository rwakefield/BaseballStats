class PlayerSearch
  def initialize(query:)
    @query = query.to_s
    @words = parsed_words
    @results = []
  end

  def search
    if words.size == 2
      by_full_name
    end
    if results.empty?
      by_single_word
    end
    results.flatten
  end

  private

  def by_single_word
    words.map(&:downcase).each do |word|
      if word_is_number?(word)
        results << Player.where(birth_year: word.to_i)
      else
        results << Player.where('LOWER(first_name) = ?', word).or(Player.where('LOWER(last_name) = ?', word))
      end
    end
  end

  def by_full_name
    results << Player.where("LOWER(first_name || ' ' || last_name) LIKE ?", "%#{words.join(' ').downcase}%")
    results.flatten!
  end

  def parsed_words
    query.gsub(/\s+/, ' ').split(' ')
  end

  def word_is_number?(word)
    (word =~ /\A[-+]?[0-9]+\z/)
  end

  attr_reader :query
  attr_accessor :results, :words
end

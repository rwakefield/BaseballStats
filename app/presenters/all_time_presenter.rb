class AllTimePresenter
  def initialize
  end

  def batting_list
    players.sort_by { |player| player.career_batting_average }.reverse[0...100]
  end

  def slugging_list
    players.sort_by { |player| player.career_slugging_percentage }.reverse[0...100]
  end

  private

  def players
    Player.left_outer_joins(:stats).where.not(stats: { id: nil }).distinct
  end
end

class PlayerDestroyer
  def self.destroy_all_players
    League.destroy_all
    Organization.destroy_all
    Player.where(imported: true).destroy_all
    Season.destroy_all
    SeasonStat.destroy_all
    Stat.destroy_all
    Team.destroy_all
  end

  def self.destroy_empty_players
    Player.all.each do |player|
      player.destroy if player.stats.empty?
    end
  end
end

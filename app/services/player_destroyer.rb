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
end

class PlayerDestroyer
  def self.destroy_all_players
    Player.where(imported: true).destroy_all
  end
end

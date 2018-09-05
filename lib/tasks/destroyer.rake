require 'csv'

namespace :destroyer do
  desc 'Destroy imported players'
  task destroy_players: :environment do
    PlayerDestroyer.destroy_all_players
  end

  desc 'Destroy players with no stats'
  task destroy_empty_players: :environment do
    PlayerDestroyer.destroy_empty_players
  end
end

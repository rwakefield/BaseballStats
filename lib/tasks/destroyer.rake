require 'csv'

namespace :destroyer do
  desc 'Destroy imported players'
  task destroy_players: :environment do
    PlayerDestroyer.destroy_all_players
  end
end

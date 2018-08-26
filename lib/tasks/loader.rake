require 'csv'

namespace :loader do
  desc 'Load Players from CSV'
  task load_players: :environment do
    csv_text = File.read('lib/tasks/data/players.csv')
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      mappings = {
        first_name: row['nameFirst'],
        last_name: row['nameLast'],
        birth_year: row['birthYear'],
        identifier: row['playerID']
      }
      PlayerLoader.new(mappings).load
    end
  end
end

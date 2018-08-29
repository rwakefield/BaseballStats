require 'csv'

namespace :loader do
  desc 'Load Players from CSV'
  task load_players: :environment do
    ActiveRecord::Base.transaction do
      csv_text = ENV["RAILS_ENV"] == 'test' ? File.read('test/lib/tasks/data/players.csv') : File.read('lib/tasks/data/players.csv')
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

  desc 'Load Batting from CSV'
  task load_batting: :environment do
    ActiveRecord::Base.transaction do
      csv_text = ENV["RAILS_ENV"] == 'test' ? File.read('test/lib/tasks/data/batting.csv') : File.read('lib/tasks/data/batting.csv')
      csv = CSV.parse(csv_text, headers: true)
      csv.each do |row|
        BattingLoader.new(csv_row: row).load
      end
    end
  end
end

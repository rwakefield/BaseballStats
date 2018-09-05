class BattingLoader
  def initialize(csv_row:)
    @csv_row = csv_row

    available_attributes.each do |attr_name, attr_value|
      self.class.send(:define_method, "#{attr_name}=".to_sym) do |value|
        instance_variable_set("@#{attr_name}", value)
      end

      self.class.send(:define_method, attr_name.to_sym) do
        instance_variable_get("@#{attr_name}")
      end

      self.send("#{attr_name}=".to_sym, attr_value)
    end
  end

  def load
    return unless player
    load_stat
    player.teams << team unless player.teams.include?(team)
    SeasonStat.find_or_create_by(season: season, player: player, stat: stat)
    Organization.find_or_create_by(team: team, league: league, level: 'Major')
  end

  private

  def available_attributes
    {
      player_identifier: csv_row['playerID'],
      season_year: csv_row['yearID'],
      league_name: csv_row['league'],
      team_name: csv_row['teamID'],
      games: csv_row['G'],
      at_bats: csv_row['AB'],
      runs_scored: csv_row['R'],
      hits: csv_row['H'],
      doubles: csv_row['2B'],
      triples: csv_row['3B'],
      home_runs: csv_row['HR'],
      runs_batted_in: csv_row['RBI'],
      stolen_bases: csv_row['SB'],
      times_caught_steeling: csv_row['CS']
    }
  end

  def player
    Player.find_by(identifier: player_identifier)
  end

  def league
    League.find_or_create_by(name: league_name)
  end

  def load_stat
    @stat = Stat.find_or_initialize_by(player_identifier: player_identifier, season_identifier: season_year.to_s, team_identifier: team_name).tap do |t|
      t.games = games
      t.at_bats = at_bats
      t.runs_scored = runs_scored
      t.hits = hits
      t.doubles = doubles
      t.triples = triples
      t.home_runs = home_runs
      t.runs_batted_in = runs_batted_in
      t.stolen_bases = stolen_bases
      t.times_caught_steeling = times_caught_steeling
    end
    stat.save!
  end

  def season
    Season.find_or_create_by(year: season_year)
  end

  def team
    Team.find_or_create_by(name: team_name)
  end

  attr_reader :csv_row, :stat
end

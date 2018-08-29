FactoryBot.define do
  factory :stat do
    player_identifier { 'player_identifier' }
    season_identifier { 'season_identifier' }
    team_identifier { 'team_identifier' }
    games { 1 }
    at_bats { 2 }
    runs_scored { 3 }
    hits { 4 }
    doubles { 5 }
    triples { 6 }
    home_runs { 7 }
    runs_batted_in { 8 }
    stolen_bases { 9 }
    times_caught_steeling { 10 }
  end
end

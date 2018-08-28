FactoryBot.define do
  factory :season_stat do
    association :player
    association :stat
    association :season
  end
end

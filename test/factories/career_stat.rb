FactoryBot.define do
  factory :career_stat do
    batting_average { 0.325 }
    slugging_percentage { 0.251 }
    association :player
  end
end

FactoryBot.define do
  factory :organization do
    association :league
    association :team
  end
end

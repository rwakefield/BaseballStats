FactoryBot.define do
  factory :player do
    first_name { 'Ted' }
    last_name { 'Williams' }
    birth_year { 1918 }
    identifier { 'goat' }
    imported { false }

    trait :imported do
      imported { true }
    end
  end
end

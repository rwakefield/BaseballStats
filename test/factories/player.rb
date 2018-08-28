FactoryBot.define do
  factory :player do
    first_name { 'Ted' }
    last_name { 'Williams' }
    birth_year { 1918 }
    identifier { 'willite01' }
    imported { false }

    trait :imported do
      imported { true }
    end

    trait :sequence_identifier do
      sequence(:identifier) { |n| "willite0#{n}" }
    end

    trait :with_team do
      teams { [FactoryBot.create(:team)] }
    end
  end
end

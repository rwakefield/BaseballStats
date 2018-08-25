FactoryBot.define do
  factory :player do
    first_name { 'Ted' }
    last_name { 'Williams' }
    birth_year { 1918 }
    identifier { 'goat' }
  end
end

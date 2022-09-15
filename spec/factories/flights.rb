FactoryBot.define do
  factory :flight do
    trait :atl_orf do
      date { '09/14/2022' }
      time { '08:00AM' }
    end
  end
end

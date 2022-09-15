FactoryBot.define do
  factory :flight do
    trait :atl_orf do
      date { Date.tomorrow }
      time { '08:00AM' }
    end
  end
end

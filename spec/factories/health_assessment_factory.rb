FactoryBot.define do
  factory :health_assessment do
    name 'Test Health Assessment'
    health_attribute
    association :created_by, factory: [:user]
    association :updated_by, factory: [:user]

    trait :with_rating do
      health_rating
    end
  end
end

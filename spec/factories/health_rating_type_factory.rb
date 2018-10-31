FactoryBot.define do
  factory :health_rating_type do
    sequence(:name) { |n| "Test HealthRatingType #{n}" }
    score 10
    weight 0.1
    threshold_min 90
    threshold_max 100
    association :created_by, factory: [:user]
    association :updated_by, factory: [:user]
  end
end

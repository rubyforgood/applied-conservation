FactoryBot.define do
  factory :default_health_rating do
    health_rating_type
    default_health_attribute
    sequence(:description) { |n| "Test DefaultHealthRating #{n}" }
  end
end

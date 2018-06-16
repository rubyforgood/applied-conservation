FactoryBot.define do
  factory :health_attribute do
    sequence(:title) { |n| "Test Health Attribute #{n}" }
    target_type
  end
end

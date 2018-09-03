FactoryBot.define do
  factory :default_health_attribute do
    sequence(:name) { |n| "Test DefaultHealthAttribute #{n}" }
    target_type
  end
end

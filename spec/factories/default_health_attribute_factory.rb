FactoryBot.define do
  factory :default_health_attribute do
    sequence(:name) { |n| "Test DefaultHealthAttribute #{n}" }
    target_type
    association :created_by, factory: [:user]
    association :updated_by, factory: [:user]
  end
end

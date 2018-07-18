FactoryBot.define do
  factory :default_health_rating do
    health_rating_type
    default_health_attribute
    association :created_by, factory: [:user]
    association :updated_by, factory: [:user]
  end
end

FactoryBot.define do
  factory :health_rating do
    health_rating_type
    health_attribute
    # default_health_attribute
    association :created_by, factory: [:user]
    association :updated_by, factory: [:user]
  end
end

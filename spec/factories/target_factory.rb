FactoryBot.define do
  factory :target do
    sequence(:name) { |n| "Test Target ##{n}" }
    project
  end
end

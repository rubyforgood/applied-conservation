FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "River Site ##{n}" }

    trait :complete do
      description { 'A beautiful water-filled ecosystem needs conservation' }
    end
  end
end

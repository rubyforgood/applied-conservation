FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Call Senator#{n}" }
    association :project

    trait :complete do
      association :user
      description { 'Do it 7 times' }
      due_date { Date.today }
    end

    trait :archived do
      status { 'Archived' }
    end
  end
end

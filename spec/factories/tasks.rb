FactoryBot.define do 
  factory :task do
    sequence(:name) {|n| "Call Senator#{n}"}
    association :project
    
    trait :complete do 
      description 'Do it 7 times'
      due_date Date.today
    end  
  end
end
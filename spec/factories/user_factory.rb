FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "bender#{n}@isgre.at" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

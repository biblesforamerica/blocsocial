FactoryGirl.define do
  factory :user do
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "yeahbuddy111"
    password_confirmation "yeahbuddy111"
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "yeahbuddy111"
    password_confirmation "yeahbuddy111"
  end

  factory :bookmark do
    sequence(:url, 100) { |n| "somesite#{n}.com" }
    user
  end
end

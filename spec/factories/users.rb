FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "example_user_#{n}" }
    sequence(:email) { |n| "email_#{n}@example.com" }
  end
end
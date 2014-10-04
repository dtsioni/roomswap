FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "example_user_#{n}" }
    sequence(:email) { |n| "email_#{n}@example.com" }
    sequence(:university_id) { |n| "#{n}" }
    sequence(:home_id) { |n| "#{n}" }
    gender "male"
    password "password"
    password_confirmation "password"
  end
end
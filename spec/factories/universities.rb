FactoryGirl.define do
  factory :university do
    sequence(:name) { |n| "example_university_#{n}" }
  end
end
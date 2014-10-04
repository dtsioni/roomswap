FactoryGirl.define do
  factory :swap do
    sequence(:user_id) { |n| "#{n}" }
    sequence(:origin_id) { |n| "#{n}" }
  end
end
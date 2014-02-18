# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    title "Great place!"
    body "Loved it!"
    rating 5
    user_id 1
    restaurant_id 1
  end
end

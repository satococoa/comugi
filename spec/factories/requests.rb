# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    user_id 1
    user_uid 'abc'
    target_uid 'def'
  end
end

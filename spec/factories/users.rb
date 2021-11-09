FactoryBot.define do
  factory :user do
    sequence(:id) { |n| }
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    sequence(:password) { |n| "encripted_password_#{n}" }
    sequence(:name) { |n| "name_#{n}" }
    sequence(:username) { |n| "User_#{n}" }
    created_at { Time.now }
    updated_at { Time.now }
    confirmed_at { Time.now }
  end
end

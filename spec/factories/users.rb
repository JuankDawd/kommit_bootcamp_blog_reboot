require 'faker'

FactoryBot.define do
  factory :user do
    sequence(:password) { |n| "encripted_password_#{n}" }
    name { Faker::Name.unique.name }
    sequence(:email) { |n| "#{name.parameterize}-#{n}@example.com" }
    sequence(:username) { Faker::Internet.username }
    created_at { Time.now }
    updated_at { Time.now }
  end
end

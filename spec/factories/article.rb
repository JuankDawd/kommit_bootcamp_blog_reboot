require 'faker'

FactoryBot.define do
  factory :article do
    title { Faker::Books::Lovecraft.tome }
    body { Faker::Books::Lovecraft.words }
    status { 'public' }
    user_id { user._id }
    created_at { Time.now }
    updated_at { Time.now }
  end
end

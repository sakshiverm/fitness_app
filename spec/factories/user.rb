require 'factory_bot'
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    # email { 'test@example.com' }
    password { 'password' }
  end
end




  
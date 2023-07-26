require 'factory_bot'
FactoryBot.define do
  factory :challenge do
    name { "push up" }
    description { "do push up" }
    duration { 2 }
    user { FactoryBot.create(:user) }
  end
end
  
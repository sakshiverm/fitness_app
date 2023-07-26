require 'factory_bot'
FactoryBot.define do
  factory :exercise do
    name { "Push Up" }
    description { "Do push up exercise" }
    workout_plan { FactoryBot.create(:workout_plan) }
  end
end
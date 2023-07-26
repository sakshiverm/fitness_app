require 'factory_bot'
FactoryBot.define do
  factory :workout_plan do
    instructions { "Sample workout instructions" }
    user { FactoryBot.create(:user) }
  end
end

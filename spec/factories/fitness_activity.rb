require 'factory_bot'
FactoryBot.define do
  factory :fitness_activity do
    steps_taken { 1000 }
    calories_burned { 500 }
    workout_duration { "1 hour" }
    user { FactoryBot.create(:user) }
  end
end

  
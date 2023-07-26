require 'factory_bot'
FactoryBot.define do
  factory :goal do
    name { "Weight Loss Goal" }
    description { "Lose weight and get fit" }
    duration { "3 months" }
    weight_loss { "10 kg" }
    user { FactoryBot.create(:user) }
  end
end


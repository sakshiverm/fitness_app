class Exercise < ApplicationRecord
  belongs_to :workout_plan
  has_one_attached :image
end

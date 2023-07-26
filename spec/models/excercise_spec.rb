require 'rails_helper'
RSpec.describe Exercise, type: :model do
  describe "associations" do
    it { should belong_to(:workout_plan) }
  end
end

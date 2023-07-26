require 'rails_helper'
RSpec.describe WorkoutPlan, type: :model do
  describe "associations" do
    it { should have_many(:exercises) }
    it { should belong_to(:user) }
  end
end


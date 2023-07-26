require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:challenges) }
    it { should have_many(:goals) }
    it { should have_many(:fitness_activities) }
    it { should have_many(:workout_plans) }
  end
end

require 'rails_helper'

RSpec.describe FitnessActivity, type: :model do
  it { should belong_to(:user) }
end
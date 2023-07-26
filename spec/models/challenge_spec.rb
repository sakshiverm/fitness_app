require 'rails_helper'

RSpec.describe Challenge, type: :model do
  it { should belong_to(:user) }
end
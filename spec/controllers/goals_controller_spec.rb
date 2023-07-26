require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  before { sign_in user }

  describe "GET #index" do
    it "assigns @goals" do
      goal = FactoryBot.create(:goal, user: user)
      get :index
      expect(assigns(:goals)).to eq([goal])
    end
  end

  describe "GET #show" do
    it "assigns @goal" do
      goal = FactoryBot.create(:goal, user: user)
      get :show, params: { id: goal.id }
      expect(assigns(:goal)).to eq(goal)
    end
  end

  describe "GET #new" do
    it "assigns a new goal to @goal" do
      get :new
      expect(assigns(:goal)).to be_a_new(Goal)
    end
  end

  describe "POST #create" do
    it "creates a new goal" do
      goal_params = FactoryBot.attributes_for(:goal, user: user)
      expect {
        post :create, params: { goal: goal_params }
      }.to change(Goal, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "assigns @goal" do
      goal = FactoryBot.create(:goal, user: user)
      get :edit, params: { id: goal.id }
      expect(assigns(:goal)).to eq(goal)
    end
  end

  describe "PATCH #update" do
    it "updates the challenge" do
      goal = FactoryBot.create(:goal, user: user)
      new_name = "Updated Goal"
      patch :update, params: { id: goal.id, goal: { name: new_name } }
      goal.reload
      expect(goal.name).to eq(new_name)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the goal" do
      goal = FactoryBot.create(:goal, user: user)
      expect {
        delete :destroy, params: { id: goal.id }
      }
    end
  end
end

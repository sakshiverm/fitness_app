require 'rails_helper'

RSpec.describe WorkoutPlansController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { FactoryBot.create(:user) }
  before { sign_in user }

  describe "GET #index" do
    it "assigns @workout_plans" do
      workout_plan = FactoryBot.create(:workout_plan, user: user)
      get :index
      expect(assigns(:workout_plans)).to eq([workout_plan])
    end
  end

  describe "GET #show" do
    it "assigns @workout_plan" do
      workout_plan = FactoryBot.create(:workout_plan, user: user)
      get :show, params: { id: workout_plan.id }
      expect(assigns(:workout_plan)).to eq(workout_plan)
    end
  end

  describe "GET #new" do
    it "assigns a new workout plan to @workout_plan" do
      get :new
      expect(assigns(:workout_plan)).to be_a_new(WorkoutPlan)
    end
  end

  describe "POST #create" do
    it "creates a new workout plan" do
      workout_plan_params = FactoryBot.attributes_for(:workout_plan, user: user)
      expect {
        post :create, params: { workout_plan: workout_plan_params }
      }.to change(WorkoutPlan, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "assigns @workout_plan" do
      workout_plan = FactoryBot.create(:workout_plan, user: user)
      get :edit, params: { id: workout_plan.id }
      expect(assigns(:workout_plan)).to eq(workout_plan)
    end
  end

  describe "PATCH #update" do
    it "updates the workout plan" do
      workout_plan = FactoryBot.create(:workout_plan, user: user)
      new_instructions = "Updated Workout Plan"
      patch :update, params: { id: workout_plan.id, workout_plan: { instructions: new_instructions } }
      workout_plan.reload
      expect(workout_plan.instructions).to eq(new_instructions)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the workout plan" do
      workout_plan = FactoryBot.create(:workout_plan, user: user)
      expect {
        delete :destroy, params: { id: workout_plan.id }
      }.to change(WorkoutPlan, :count).by(-1)
    end
  end
end



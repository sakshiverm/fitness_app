require 'rails_helper'

RSpec.describe FitnessActivitiesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  before { sign_in user }

  describe "GET #index" do
    it "assigns @fitness_activities" do
      fitness_activity = FactoryBot.create(:fitness_activity, user: user)
      get :index
      expect(assigns(:fitness_activities)).to eq([fitness_activity])
    end
  end

  describe "GET #show" do
    it "assigns @fitness_activity" do
        fitness_activity = FactoryBot.create(:fitness_activity, user: user)
      get :show, params: { id: fitness_activity.id }
      expect(assigns(:fitness_activity)).to eq(fitness_activity)
    end
  end

  describe "GET #new" do
    it "assigns a new fitness_activity to @fitness_activity" do
      get :new
      expect(assigns(:fitness_activity)).to be_a_new(FitnessActivity)
    end
  end

  describe "POST #create" do
    it "creates a new fitness_activity" do
      fitness_activity_params = FactoryBot.attributes_for(:fitness_activity, user: user)
      expect {
        post :create, params: { fitness_activity: fitness_activity_params }
      }.to change(FitnessActivity, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "assigns @fitness_activity" do
      fitness_activity = FactoryBot.create(:fitness_activity, user: user)
      get :edit, params: { id: fitness_activity.id }
      expect(assigns(:fitness_activity)).to eq(fitness_activity)
    end
  end

  describe "PATCH #update" do
    it "updates the fitness_activity" do
      fitness_activity = FactoryBot.create(:fitness_activity, user: user)
      new_steps_taken = 3000
      patch :update, params: { id: fitness_activity.id, fitness_activity: { steps_taken: new_steps_taken } }
      fitness_activity.reload
      expect(fitness_activity.steps_taken).to eq(new_steps_taken)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the fitness_activity" do
      fitness_activity = FactoryBot.create(:fitness_activity, user: user)
      expect {
        delete :destroy, params: { id: fitness_activity.id }
      }
    end
  end
end

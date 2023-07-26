require 'rails_helper'
RSpec.describe ExercisesController, type: :controller do
    include Devise::Test::ControllerHelpers
    let(:user) { FactoryBot.create(:user) }
  
    before { sign_in user }
  
    describe "GET #show" do
      it "renders the show template" do
        workout_plan = FactoryBot.create(:workout_plan, user: user)
        exercise = FactoryBot.create(:exercise, workout_plan: workout_plan)
        get :show, params: { workout_plan_id: workout_plan.id, id: exercise.id }
        expect(response).to render_template(:show)
      end
    end
  
    describe "GET #new" do
      it "renders the new template" do
        workout_plan = FactoryBot.create(:workout_plan, user: user)
        get :new, params: { workout_plan_id: workout_plan.id }
        expect(response).to render_template(:new)
      end
    end
  
    describe "POST #create" do
      it "creates a new exercise" do
        workout_plan = FactoryBot.create(:workout_plan, user: user)
        exercise_params = FactoryBot.attributes_for(:exercise)
        expect {
          post :create, params: { workout_plan_id: workout_plan.id, exercise: exercise_params }
        }.to change(Exercise, :count).by(1)
      end
    end
  
    describe "GET #edit" do
      it "renders the edit template" do
        workout_plan = FactoryBot.create(:workout_plan, user: user)
        exercise = FactoryBot.create(:exercise, workout_plan: workout_plan)
        get :edit, params: { workout_plan_id: workout_plan.id, id: exercise.id }
        expect(response).to render_template(:edit)
      end
    end
  
    describe "PATCH #update" do
      it "updates the exercise" do
        workout_plan = FactoryBot.create(:workout_plan, user: user)
        exercise = FactoryBot.create(:exercise, workout_plan: workout_plan)
        new_name = "Updated Exercise"
        patch :update, params: { workout_plan_id: workout_plan.id, id: exercise.id, exercise: { name: new_name } }
        exercise.reload
        expect(exercise.name).to eq(new_name)
      end
    end
  
    describe "DELETE #destroy" do
      it "deletes the exercise" do
        workout_plan = FactoryBot.create(:workout_plan, user: user)
        exercise = FactoryBot.create(:exercise, workout_plan: workout_plan)
        expect {
          delete :destroy, params: { workout_plan_id: workout_plan.id, id: exercise.id }
        }.to change(Exercise, :count).by(-1)
      end
  
    end
  end
  
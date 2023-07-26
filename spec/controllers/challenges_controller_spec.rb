require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  before { sign_in user }

  describe "GET #index" do
    it "assigns @challenges" do
      challenge = FactoryBot.create(:challenge, user: user)
      get :index
      expect(assigns(:challenges)).to eq([challenge])
    end
  end

  describe "GET #show" do
    it "assigns @challenge" do
      challenge = FactoryBot.create(:challenge, user: user)
      get :show, params: { id: challenge.id }
      expect(assigns(:challenge)).to eq(challenge)
    end
  end

  describe "GET #new" do
    it "assigns a new challenge to @challenge" do
      get :new
      expect(assigns(:challenge)).to be_a_new(Challenge)
    end
  end

  describe "POST #create" do
    it "creates a new challenge" do
      challenge_params = FactoryBot.attributes_for(:challenge, user: user)
      expect {
        post :create, params: { challenge: challenge_params }
      }.to change(Challenge, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "assigns @challenge" do
      challenge = FactoryBot.create(:challenge, user: user)
      get :edit, params: { id: challenge.id }
      expect(assigns(:challenge)).to eq(challenge)
    end
  end

  describe "PATCH #update" do
    it "updates the challenge" do
      challenge = FactoryBot.create(:challenge, user: user)
      new_name = "Updated Challenge"
      patch :update, params: { id: challenge.id, challenge: { name: new_name } }
      challenge.reload
      expect(challenge.name).to eq(new_name)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the challenge" do
      challenge = FactoryBot.create(:challenge, user: user)
      expect {
        delete :destroy, params: { id: challenge.id }
      }.to change(Challenge, :count).by(-1)
    end
  end
end

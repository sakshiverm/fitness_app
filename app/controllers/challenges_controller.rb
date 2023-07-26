class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def index
    @challenges = current_user.challenges
  end

  def show
    @challenge = current_user.challenges.find(params[:id])
  end

  def new
    @challenge = current_user.challenges.build
  end

  def create
    @challenge = current_user.challenges.build(challenge_params)
    if @challenge.save
      ReminderWorker.perform_async(@challenge.id)
      redirect_to @challenge, notice: 'Challenge created successfully.'
    else
      render :new
    end
  end

  def edit
    @challenge = current_user.challenges.find(params[:id])
  end

  def update
    @challenge = current_user.challenges.find(params[:id])
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: 'Challenge updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @challenge = current_user.challenges.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path, notice: 'Challenge deleted successfully.'
  end

  private
  
  def challenge_params
    params.require(:challenge).permit(:name, :description, :duration, :user_id)
  end
end

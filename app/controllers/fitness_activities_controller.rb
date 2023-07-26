class FitnessActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @fitness_activities = current_user.fitness_activities
  end

  def show
    @fitness_activity = current_user.fitness_activities.find(params[:id])
  end

  def new
    @fitness_activity = current_user.fitness_activities.build
  end

  def create
    @fitness_activity = current_user.fitness_activities.build(fitness_activity_params)
    if @fitness_activity.save
      redirect_to @fitness_activity, notice: 'Fitness activity tracked successfully.'
    else
      render :new
    end
  end

  def edit
    @fitness_activity = current_user.fitness_activities.find(params[:id])
  end

  def update
    @fitness_activity = current_user.fitness_activities.find(params[:id])
    if @fitness_activity.update(fitness_activity_params)
      redirect_to @fitness_activity, notice: 'Activity updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @fitness_activity = current_user.fitness_activities.find(params[:id])
    @fitness_activity.destroy
    redirect_to fitness_activities_path, notice: 'fitness activity deleted successfully.'
  end

  private

  def fitness_activity_params
    params.require(:fitness_activity).permit(:steps_taken, :calories_burned, :workout_duration)
  end

end

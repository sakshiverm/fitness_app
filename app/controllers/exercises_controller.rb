class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    @exercise = @workout_plan.exercises.build
  end

  def create
    @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    @exercise = @workout_plan.exercises.build(exercise_params)
    if @exercise.save
      redirect_to @workout_plan, notice: 'Exercise created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise.workout_plan, notice: 'Exercise updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to @exercise.workout_plan, notice: 'Exercise deleted successfully.'
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :image)
  end
  
end

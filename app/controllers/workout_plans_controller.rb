class WorkoutPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan, only: [:show, :edit, :update, :destroy]

  def index
    @workout_plans = current_user.workout_plans
  end

  def show
    @workout_plan = current_user.workout_plans.find(params[:id])
    @exercises = @workout_plan.exercises
  end

  def new
    @workout_plan = current_user.workout_plans.build
  end
  
  def create
    @workout_plan = current_user.workout_plans.build(workout_plan_params)
    if @workout_plan.save
      redirect_to @workout_plan, notice: 'Workout plan created successfully.'
    else
      render :new
    end
  end

  def edit
    @workout_plan = current_user.workout_plans.find(params[:id])
  end

  def update
    @workout_plan = current_user.workout_plans.find(params[:id])
    if @workout_plan.update(workout_plan_params)
      redirect_to @workout_plan, notice: 'Workout plan updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @workout_plan.destroy
    redirect_to workout_plans_path, notice: 'Workout plan deleted successfully.'
  end

  private

  def set_workout_plan
    @workout_plan = current_user.workout_plans.find(params[:id])
  end

  def workout_plan_params
    params.require(:workout_plan).permit(:instructions)
  end
end

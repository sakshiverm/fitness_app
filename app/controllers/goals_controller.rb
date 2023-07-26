class GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = current_user.goals
  end

  def show
    @goal = current_user.goals.find(params[:id])
  end

  def new
    @goal = current_user.goals.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to @goal, notice: 'Goals created successfully.'
    else
      render :new
    end
  end

  def edit 
    @goal = current_user.goals.find(params[:id])
  end

  def update
    @goal = current_user.goals.find(params[:id])
    if @goal.update(goal_params)
      redirect_to @goal, notice: 'Goals updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy
    redirect_to goals_path, notice: 'Goal deleted successfully.'
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :duration, :weight_loss, :user_id)
  end
end  

class EdgesController < ApplicationController
  before_action :set_goal
  before_action :set_step

  def add_step_goal_edge
    if !@step.goals.include?(@goal)
      @step.goals << @goal
      redirect_to @goal
    end
  end

  private
  
  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_step
    @step = Step.find(params[:step_id])
  end
end
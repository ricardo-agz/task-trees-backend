class StepsController < ApplicationController
  before_action :set_step, only: [:show, :update, :destroy, :goal_edges]

  # GET /steps
  def index
    @goal = Goal.find(params[:goal_id])
    @steps = Step.where(goal_id: @goal.id)

    render json: @steps
  end

  def goal_edges
    @goals = @step.goals
    render json: @goals
  end

  # GET /steps/1
  def show
    render json: @step
  end

  # POST /steps
  def create
    @goal = Goal.find(params[:goal_id])
    @step = @goal.steps.build(step_params)

    if @step.save
      render json: @step, status: :created, location: goal_step_url(@step.goal, @step)
    else
      render json: @step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /steps/1
  def update
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /steps/1
  def destroy
    @step.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def step_params
      params.require(:step).permit(:name, :goal_id)
    end
end
